//
//  ScrollOffsetTracker.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

struct ScrollOffsetTracker: ViewModifier {
    @Binding var scrollOffset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: ScrollOffsetPreferenceKey.self,
                            value: proxy.frame(in: .named("scroll")).minY
                        )
                }
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                let newOffset = max(0, -value)
                if abs(newOffset - scrollOffset) > 2 {
                    scrollOffset = newOffset
                }
            }
            .coordinateSpace(name: "scroll")
    }
}

extension View {
    func trackScrollOffset(_ offset: Binding<CGFloat>) -> some View {
        modifier(ScrollOffsetTracker(scrollOffset: offset))
    }
}

