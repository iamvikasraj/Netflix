//
//  AppRouter.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

/// Main router for handling app navigation
class AppRouter: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var presentedSheet: Route?
    @Published var presentedFullScreenCover: Route?
    @Published var selectedTab: Tab = .home
    
    enum Tab: String, CaseIterable {
        case home
        case newHot
        case myNetflix
        
        var id: String { rawValue }
    }
    
    /// Switch to a different tab
    func selectTab(_ tab: Tab) {
        selectedTab = tab
    }
    
    /// Navigate to a route using NavigationStack
    func navigate(to route: Route) {
        navigationPath.append(route)
    }
    
    /// Present a route as a sheet
    func presentSheet(_ route: Route) {
        presentedSheet = route
    }
    
    /// Present a route as a full screen cover
    func presentFullScreenCover(_ route: Route) {
        presentedFullScreenCover = route
    }
    
    /// Dismiss the current sheet
    func dismissSheet() {
        presentedSheet = nil
    }
    
    /// Dismiss the current full screen cover
    func dismissFullScreenCover() {
        presentedFullScreenCover = nil
    }
    
    /// Pop to root or go back
    func goBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    /// Pop to root
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}

/// Route definitions for navigation
enum Route: Hashable, Identifiable {
    var id: Self { self }
    // Detail views
    case movieDetail(id: String)
    case showDetail(id: String)
    case gameDetail(id: String)
    
    // Generic content detail (can be movie, show, or game)
    case contentDetail(id: String, type: ContentType)
    
    // Profile/Account
    case profile
    case settings
    case myList
    case downloads
    
    // Search
    case search
    case searchResults(query: String)
    
    // Categories
    case category(name: String)
    
    // Episodes/Seasons
    case seasonDetail(showId: String, seasonNumber: Int)
    case episodeDetail(showId: String, seasonNumber: Int, episodeNumber: Int)
    
    // Playback
    case player(contentId: String)
}

// ContentType moved to Models/ContentModels.swift

