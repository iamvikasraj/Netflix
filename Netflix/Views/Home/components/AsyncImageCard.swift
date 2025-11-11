//
//  AsyncImageCard.swift
//  Netflix
//
//  Card component that loads images from URL (TMDB)
//

import SwiftUI

struct AsyncImageCard: View {
    let imageURL: URL?
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    init(imageURL: URL?, width: CGFloat = 110, height: CGFloat = 159, cornerRadius: CGFloat = 4) {
        self.imageURL = imageURL
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let imageURL = imageURL {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        // Placeholder while loading
                        ProgressView()
                            .frame(width: width, height: height)
                            .background(Color.gray.opacity(0.3))
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: width, height: height)
                            .clipped()
                    case .failure(let error):
                        // Fallback placeholder
                        VStack {
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                            Text("Failed")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .frame(width: width, height: height)
                        .background(Color.gray.opacity(0.3))
                        .onAppear {
                            print("❌ Image load failed for URL: \(imageURL.absoluteString)")
                            print("Error: \(error.localizedDescription)")
                        }
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                // No URL provided
                VStack {
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                    Text("No image")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                .frame(width: width, height: height)
                .background(Color.gray.opacity(0.3))
            }
        }
        .frame(width: width, height: height)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(red: 0.16, green: 0.16, blue: 0.16).opacity(0.2), lineWidth: 1)
        )
    }
}

// Example usage with TMDB data
struct TMDBMediumCard: View {
    let movie: TMDBMovie
    
    var body: some View {
        AsyncImageCard(
            imageURL: TMDBService.shared.posterURL(path: movie.posterPath ?? ""),
            width: 110,
            height: 159
        )
    }
}

