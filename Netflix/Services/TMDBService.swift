//
//  TMDBService.swift
//  Netflix
//
//  TMDB API Service for fetching movie and TV show data
//  Get your free API key at: https://www.themoviedb.org/settings/api
//

import Foundation

class TMDBService {
    static let shared = TMDBService()
    
    // TMDB API key
    private let apiKey = "f50d2cea9e284ba959e6da3676be5bf1"
    private let baseURL = "https://api.themoviedb.org/3"
    private let imageBaseURL = "https://image.tmdb.org/t/p"
    
    private init() {}
    
    // MARK: - Image URL Helpers
    
    /// Get poster image URL (for card covers)
    /// - Parameters:
    ///   - path: Poster path from TMDB
    ///   - size: Image size (w500, w780, original, etc.)
    func posterURL(path: String, size: String = "w500") -> URL? {
        guard !path.isEmpty else { return nil }
        // TMDB paths start with /, so we need to ensure proper URL construction
        let cleanPath = path.hasPrefix("/") ? path : "/\(path)"
        return URL(string: "\(imageBaseURL)/\(size)\(cleanPath)")
    }
    
    /// Get backdrop image URL (for hero images)
    func backdropURL(path: String, size: String = "w1280") -> URL? {
        guard !path.isEmpty else { return nil }
        // TMDB paths start with /, so we need to ensure proper URL construction
        let cleanPath = path.hasPrefix("/") ? path : "/\(path)"
        return URL(string: "\(imageBaseURL)/\(size)\(cleanPath)")
    }
    
    // MARK: - API Calls
    
    private func validateAPIKey() throws {
        if apiKey == "YOUR_API_KEY_HERE" || apiKey.isEmpty {
            throw TMDBError.apiKeyNotSet
        }
    }
    
    /// Fetch trending movies
    func fetchTrendingMovies() async throws -> [TMDBMovie] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/trending/movie/day?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBMovie>.self, from: data)
        return response.results
    }
    
    /// Fetch trending TV shows
    func fetchTrendingTVShows() async throws -> [TMDBTVShow] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/trending/tv/day?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBTVShow>.self, from: data)
        return response.results
    }
    
    /// Fetch popular movies
    func fetchPopularMovies() async throws -> [TMDBMovie] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBMovie>.self, from: data)
        return response.results
    }
    
    /// Fetch top rated movies
    func fetchTopRatedMovies() async throws -> [TMDBMovie] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/movie/top_rated?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBMovie>.self, from: data)
        return response.results
    }
    
    /// Search movies and TV shows
    func search(query: String) async throws -> [TMDBContent] {
        try validateAPIKey()
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: "\(baseURL)/search/multi?api_key=\(apiKey)&query=\(encodedQuery)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBContent>.self, from: data)
        return response.results
    }
    
    /// Fetch movies by genre
    /// Genre IDs: 28=Action, 35=Comedy, 18=Drama, 10751=Family, 14=Fantasy, 27=Horror, 10749=Romance, 878=Sci-Fi, 53=Thriller
    func fetchMoviesByGenre(genreId: Int) async throws -> [TMDBMovie] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/discover/movie?api_key=\(apiKey)&with_genres=\(genreId)&sort_by=popularity.desc")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBMovie>.self, from: data)
        return response.results
    }
    
    /// Fetch now playing movies
    func fetchNowPlayingMovies() async throws -> [TMDBMovie] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/movie/now_playing?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBMovie>.self, from: data)
        return response.results
    }
    
    /// Fetch upcoming movies
    func fetchUpcomingMovies() async throws -> [TMDBMovie] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/movie/upcoming?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBMovie>.self, from: data)
        return response.results
    }
    
    /// Fetch top rated TV shows
    func fetchTopRatedTVShows() async throws -> [TMDBTVShow] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/tv/top_rated?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBTVShow>.self, from: data)
        return response.results
    }
    
    /// Fetch TV shows by genre
    /// Genre IDs: 10759=Action & Adventure, 35=Comedy, 18=Drama, 10751=Family, 10765=Sci-Fi & Fantasy
    func fetchTVShowsByGenre(genreId: Int) async throws -> [TMDBTVShow] {
        try validateAPIKey()
        let url = URL(string: "\(baseURL)/discover/tv?api_key=\(apiKey)&with_genres=\(genreId)&sort_by=popularity.desc")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBResponse<TMDBTVShow>.self, from: data)
        return response.results
    }
}

// MARK: - Errors

enum TMDBError: LocalizedError {
    case apiKeyNotSet
    
    var errorDescription: String? {
        switch self {
        case .apiKeyNotSet:
            return "TMDB API key is not set. Please add your API key in TMDBService.swift. Get a free key at: https://www.themoviedb.org/settings/api"
        }
    }
}

// MARK: - Response Models

struct TMDBResponse<T: Codable>: Codable {
    let results: [T]
    let page: Int
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case results, page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Content Models

struct TMDBMovie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct TMDBTVShow: Codable, Identifiable {
    let id: Int
    let name: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// Unified content type for search results
struct TMDBContent: Codable, Identifiable {
    let id: Int
    let title: String?
    let name: String?
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let mediaType: String
    let voteAverage: Double
    
    var displayTitle: String {
        return title ?? name ?? "Unknown"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, name, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case mediaType = "media_type"
        case voteAverage = "vote_average"
    }
}

