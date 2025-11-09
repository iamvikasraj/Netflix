//
//  RouterExtension.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

/// Extension to easily access router from environment
extension View {
    func withRouter() -> some View {
        self.environmentObject(AppRouter())
    }
}

/// Helper view modifier for navigation actions
struct RouterAction: ViewModifier {
    @EnvironmentObject var router: AppRouter
    let action: (AppRouter) -> Void
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            action(router)
        }
    }
}

extension View {
    func routerAction(_ action: @escaping (AppRouter) -> Void) -> some View {
        modifier(RouterAction(action: action))
    }
}

