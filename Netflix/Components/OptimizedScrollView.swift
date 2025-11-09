//
//  OptimizedScrollView.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

/// Optimized scroll offset tracker that throttles updates
class ScrollOffsetThrottler: ObservableObject {
    @Published var offset: CGFloat = 0
    private var lastUpdate: Date = Date()
    private let throttleInterval: TimeInterval = 0.016 // ~60fps
    
    func update(_ newOffset: CGFloat) {
        let now = Date()
        if now.timeIntervalSince(lastUpdate) >= throttleInterval {
            offset = newOffset
            lastUpdate = now
        }
    }
}

/// Optimized scroll view with efficient offset tracking
struct OptimizedScrollView<Content: View>: View {
    let content: Content
    @StateObject private var tracker = ScrollOffsetThrottler()
    let onScroll: ((CGFloat) -> Void)?
    
    init(@ViewBuilder content: () -> Content, onScroll: ((CGFloat) -> Void)? = nil) {
        self.content = content()
        self.onScroll = onScroll
    }
    
    var body: some View {
        ScrollView {
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
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            let offset = max(0, -value)
            tracker.update(offset)
            onScroll?(offset)
        }
    }
}

