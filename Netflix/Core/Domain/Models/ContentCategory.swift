//
//  ContentCategory.swift
//  Netflix
//
//  Domain model for content categories
//

import Foundation

enum ContentCategory: String, CaseIterable, Hashable {
    case trending
    case topRated
    case popular
    case nowPlaying
    case upcoming
    case action
    case comedy
    case drama
    case family
    case thriller
    case romance
    case horror
    case sciFi
    case tvShows
    case topRatedTV
    
    var displayName: String {
        switch self {
        case .trending: return "Trending"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .action: return "Action"
        case .comedy: return "Comedy"
        case .drama: return "Drama"
        case .family: return "Family"
        case .thriller: return "Thriller"
        case .romance: return "Romance"
        case .horror: return "Horror"
        case .sciFi: return "Sci-Fi"
        case .tvShows: return "TV Shows"
        case .topRatedTV: return "Top Rated TV"
        }
    }
    
    var genreId: Int? {
        switch self {
        case .action: return 28
        case .comedy: return 35
        case .drama: return 18
        case .family: return 10751
        case .thriller: return 53
        case .romance: return 10749
        case .horror: return 27
        case .sciFi: return 878
        default: return nil
        }
    }
    
    static func fromTitle(_ title: String) -> ContentCategory {
        let lowerTitle = title.lowercased()
        
        if lowerTitle.contains("tv show") || lowerTitle.contains("emmy") {
            return .tvShows
        } else if lowerTitle.contains("top 10") && lowerTitle.contains("tv") {
            return .topRatedTV
        } else if lowerTitle.contains("top searches") {
            return .popular
        } else if lowerTitle.contains("new on") || lowerTitle.contains("upcoming") || lowerTitle.contains("coming soon") {
            return .upcoming
        } else if lowerTitle.contains("now playing") || lowerTitle.contains("in theaters") {
            return .nowPlaying
        } else if lowerTitle.contains("action") || lowerTitle.contains("beast mode") {
            return .action
        } else if lowerTitle.contains("comedy") || lowerTitle.contains("witty") {
            return .comedy
        } else if lowerTitle.contains("drama") || lowerTitle.contains("emotional") {
            return .drama
        } else if lowerTitle.contains("family") || lowerTitle.contains("children") {
            return .family
        } else if lowerTitle.contains("thriller") || lowerTitle.contains("suspense") {
            return .thriller
        } else if lowerTitle.contains("romance") || lowerTitle.contains("romantic") {
            return .romance
        } else if lowerTitle.contains("top rated") || lowerTitle.contains("critically acclaimed") {
            return .topRated
        } else if lowerTitle.contains("popular") || lowerTitle.contains("trending") {
            return .popular
        } else {
            return .trending
        }
    }
}

