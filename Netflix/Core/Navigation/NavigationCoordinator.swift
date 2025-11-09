//
//  NavigationCoordinator.swift
//  Netflix
//
//  Navigation coordinator for app-wide navigation
//

import SwiftUI

enum AppRoute {
    case home
    case hot
    case profile
    case movieDetail(Movie)
    case tvShowDetail(TVShow)
    case search
}

extension AppRoute: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine(0)
        case .hot:
            hasher.combine(1)
        case .profile:
            hasher.combine(2)
        case .movieDetail(let movie):
            hasher.combine(3)
            hasher.combine(movie.id)
        case .tvShowDetail(let tvShow):
            hasher.combine(4)
            hasher.combine(tvShow.id)
        case .search:
            hasher.combine(5)
        }
    }
    
    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case (.home, .home), (.hot, .hot), (.profile, .profile), (.search, .search):
            return true
        case (.movieDetail(let lhsMovie), .movieDetail(let rhsMovie)):
            return lhsMovie.id == rhsMovie.id
        case (.tvShowDetail(let lhsShow), .tvShowDetail(let rhsShow)):
            return lhsShow.id == rhsShow.id
        default:
            return false
        }
    }
}

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
}

