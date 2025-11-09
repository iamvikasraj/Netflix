//
//  ContentRepository.swift
//  Netflix
//
//  Repository pattern for content data access
//

import Foundation

protocol ContentRepositoryProtocol {
    func fetchMovies(category: ContentCategory) async throws -> [Movie]
    func fetchTVShows(category: ContentCategory) async throws -> [TVShow]
    func fetchTopRatedMovies() async throws -> [Movie]
    func fetchTopRatedTVShows() async throws -> [TVShow]
    func search(query: String) async throws -> [any ContentItem]
}

class ContentRepository: ContentRepositoryProtocol {
    private let tmdbService: TMDBServiceProtocol
    
    init(tmdbService: TMDBServiceProtocol) {
        self.tmdbService = tmdbService
    }
    
    func fetchMovies(category: ContentCategory) async throws -> [Movie] {
        let tmdbMovies: [TMDBMovie]
        
        switch category {
        case .trending:
            tmdbMovies = try await tmdbService.fetchTrendingMovies()
        case .popular:
            tmdbMovies = try await tmdbService.fetchPopularMovies()
        case .nowPlaying:
            tmdbMovies = try await tmdbService.fetchNowPlayingMovies()
        case .upcoming:
            tmdbMovies = try await tmdbService.fetchUpcomingMovies()
        case .topRated:
            tmdbMovies = try await tmdbService.fetchTopRatedMovies()
        case .action, .comedy, .drama, .family, .thriller, .romance, .horror, .sciFi:
            guard let genreId = category.genreId else {
                throw ContentError.invalidCategory
            }
            tmdbMovies = try await tmdbService.fetchMoviesByGenre(genreId: genreId)
        default:
            tmdbMovies = try await tmdbService.fetchTrendingMovies()
        }
        
        return tmdbMovies.map { Movie(from: $0) }
    }
    
    func fetchTVShows(category: ContentCategory) async throws -> [TVShow] {
        let tmdbTVShows: [TMDBTVShow]
        
        switch category {
        case .trending, .tvShows:
            tmdbTVShows = try await tmdbService.fetchTrendingTVShows()
        case .topRatedTV:
            tmdbTVShows = try await tmdbService.fetchTopRatedTVShows()
        case .comedy:
            guard let genreId = category.genreId else {
                throw ContentError.invalidCategory
            }
            tmdbTVShows = try await tmdbService.fetchTVShowsByGenre(genreId: genreId)
        default:
            tmdbTVShows = try await tmdbService.fetchTrendingTVShows()
        }
        
        return tmdbTVShows.map { TVShow(from: $0) }
    }
    
    func fetchTopRatedMovies() async throws -> [Movie] {
        let tmdbMovies = try await tmdbService.fetchTopRatedMovies()
        return tmdbMovies.map { Movie(from: $0) }
    }
    
    func fetchTopRatedTVShows() async throws -> [TVShow] {
        let tmdbTVShows = try await tmdbService.fetchTopRatedTVShows()
        return tmdbTVShows.map { TVShow(from: $0) }
    }
    
    func search(query: String) async throws -> [any ContentItem] {
        _ = try await tmdbService.search(query: query)
        // Convert TMDBContent to domain models
        return [] // TODO: Implement conversion
    }
}

enum ContentError: LocalizedError {
    case invalidCategory
    case networkError
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidCategory:
            return "Invalid content category"
        case .networkError:
            return "Network error occurred"
        case .decodingError:
            return "Failed to decode response"
        }
    }
}

// Protocol for TMDBService to enable testing
protocol TMDBServiceProtocol {
    func fetchTrendingMovies() async throws -> [TMDBMovie]
    func fetchTrendingTVShows() async throws -> [TMDBTVShow]
    func fetchPopularMovies() async throws -> [TMDBMovie]
    func fetchTopRatedMovies() async throws -> [TMDBMovie]
    func fetchNowPlayingMovies() async throws -> [TMDBMovie]
    func fetchUpcomingMovies() async throws -> [TMDBMovie]
    func fetchMoviesByGenre(genreId: Int) async throws -> [TMDBMovie]
    func fetchTopRatedTVShows() async throws -> [TMDBTVShow]
    func fetchTVShowsByGenre(genreId: Int) async throws -> [TMDBTVShow]
    func search(query: String) async throws -> [TMDBContent]
    func posterURL(path: String, size: String) -> URL?
}

// Make TMDBService conform to protocol
extension TMDBService: TMDBServiceProtocol {}

