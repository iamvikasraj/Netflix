//
//  ContentItem.swift
//  Netflix
//
//  Domain model for content items (movies/TV shows)
//

import Foundation

protocol ContentItem: Identifiable, Codable {
    var id: Int { get }
    var title: String { get }
    var overview: String { get }
    var posterPath: String? { get }
    var backdropPath: String? { get }
    var voteAverage: Double { get }
    var voteCount: Int { get }
    var releaseDate: String? { get }
}

struct Movie: ContentItem, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    
    init(from tmdbMovie: TMDBMovie) {
        self.id = tmdbMovie.id
        self.title = tmdbMovie.title
        self.overview = tmdbMovie.overview
        self.posterPath = tmdbMovie.posterPath
        self.backdropPath = tmdbMovie.backdropPath
        self.releaseDate = tmdbMovie.releaseDate
        self.voteAverage = tmdbMovie.voteAverage
        self.voteCount = tmdbMovie.voteCount
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
}

struct TVShow: ContentItem, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    
    var name: String { title }
    var firstAirDate: String? { releaseDate }
    
    init(from tmdbTVShow: TMDBTVShow) {
        self.id = tmdbTVShow.id
        self.title = tmdbTVShow.name
        self.overview = tmdbTVShow.overview
        self.posterPath = tmdbTVShow.posterPath
        self.backdropPath = tmdbTVShow.backdropPath
        self.releaseDate = tmdbTVShow.firstAirDate
        self.voteAverage = tmdbTVShow.voteAverage
        self.voteCount = tmdbTVShow.voteCount
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TVShow, rhs: TVShow) -> Bool {
        lhs.id == rhs.id
    }
}

