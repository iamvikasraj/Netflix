//
//  UIImage+AmbientColor.swift
//  Netflix
//
//  Extracts a representative ambient color from an image so the UI can
//  tint the area behind the hero — mirroring the iOS Netflix app, where
//  the top of the screen picks up the dominant color of the featured art.
//

import UIKit
import CoreImage

extension UIImage {
    /// The average color of the image, computed by reducing the whole image
    /// to a single pixel via Core Image's `CIAreaAverage` filter.
    /// Returns `nil` if the image can't be processed.
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }

        let extent = inputImage.extent
        guard extent.width > 0, extent.height > 0 else { return nil }

        let extentVector = CIVector(x: extent.origin.x,
                                    y: extent.origin.y,
                                    z: extent.size.width,
                                    w: extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage",
                                    parameters: [kCIInputImageKey: inputImage,
                                                 kCIInputExtentKey: extentVector]),
              let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255.0,
                       green: CGFloat(bitmap[1]) / 255.0,
                       blue: CGFloat(bitmap[2]) / 255.0,
                       alpha: CGFloat(bitmap[3]) / 255.0)
    }

    /// A version of `averageColor` nudged toward a darker, more saturated tone
    /// so it reads as an ambient backdrop rather than a flat wash.
    var ambientColor: UIColor? {
        guard let base = averageColor else { return nil }

        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        guard base.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            return base
        }

        // Keep it moody: pull brightness well down so the tint sits just above
        // black (a subtle glow, not a gray panel), and push saturation up so any
        // hue in near-grayscale art still reads.
        let adjustedBrightness = min(brightness, 0.32)
        let adjustedSaturation = min(saturation * 1.7, 0.85)
        return UIColor(hue: hue,
                       saturation: adjustedSaturation,
                       brightness: adjustedBrightness,
                       alpha: 1.0)
    }
}
