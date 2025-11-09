//
//  ScrollBlurEffect.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

/// View modifier that adds a blur effect at the top when scrolling
struct ScrollBlurModifier: ViewModifier {
    @State private var scrollOffset: CGFloat = 0
    let blurHeight: CGFloat
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                content
                
                // Blur overlay that appears when scrolling
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(min(scrollOffset / 100, 0.8)),
                        Color.black.opacity(0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: blurHeight)
                .blur(radius: min(scrollOffset / 50, 10))
                .allowsHitTesting(false)
            }
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
                }
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollOffset = max(0, -value)
            }
        }
        .coordinateSpace(name: "scroll")
    }
}

/// Preference key for tracking scroll offset
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    /// Adds a blur effect at the top when scrolling
    /// - Parameter height: The height of the blur effect area
    func scrollBlurEffect(height: CGFloat = 200) -> some View {
        modifier(ScrollBlurModifier(blurHeight: height))
    }
}

/// Alternative implementation using Liquid Glass (iOS 18+)
struct MaterialBlurModifier: ViewModifier {
    @State private var scrollOffset: CGFloat = 0
    let blurHeight: CGFloat
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                content
                
                // Liquid Glass effect
                Rectangle()
                    .glassEffect()
                    .frame(height: blurHeight)
                    .opacity(min(scrollOffset / 80, 1.0))
                    .allowsHitTesting(false)
            }
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
                }
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollOffset = max(0, -value)
            }
        }
        .coordinateSpace(name: "scroll")
    }
}

extension View {
    /// Adds a liquid glass blur effect at the top when scrolling (iOS 18+)
    /// - Parameter height: The height of the blur effect area
    func materialBlurEffect(height: CGFloat = 200) -> some View {
        modifier(MaterialBlurModifier(blurHeight: height))
    }
}

