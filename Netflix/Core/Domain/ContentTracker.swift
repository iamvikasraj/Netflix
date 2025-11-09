//
//  ContentTracker.swift
//  Netflix
//
//  Tracks displayed content to avoid duplicates across sections
//

import Foundation

@MainActor
class ContentTracker: ObservableObject {
    static let shared = ContentTracker()
    
    private var displayedMovieIds: Set<Int> = []
    private var displayedTVShowIds: Set<Int> = []
    
    private init() {}
    
    func filterMovies(_ movies: [Movie], minCount: Int = 10) -> [Movie] {
        let filtered = movies.filter { !displayedMovieIds.contains($0.id) }
        
        // If we don't have enough unique movies, try to get more by fetching additional pages
        // For now, we'll just return what we have
        if filtered.count < minCount && movies.count > filtered.count {
            // Could implement pagination here to fetch more movies
            print("⚠️ Only \(filtered.count) unique movies available (requested \(minCount))")
        }
        
        // Mark filtered movies as displayed
        displayedMovieIds.formUnion(Set(filtered.map { $0.id }))
        return filtered
    }
    
    func filterTVShows(_ tvShows: [TVShow], minCount: Int = 10) -> [TVShow] {
        let filtered = tvShows.filter { !displayedTVShowIds.contains($0.id) }
        
        // If we don't have enough unique TV shows, try to get more
        if filtered.count < minCount && tvShows.count > filtered.count {
            print("⚠️ Only \(filtered.count) unique TV shows available (requested \(minCount))")
        }
        
        // Mark filtered TV shows as displayed
        displayedTVShowIds.formUnion(Set(filtered.map { $0.id }))
        return filtered
    }
    
    func markAsDisplayed(movieId: Int) {
        displayedMovieIds.insert(movieId)
    }
    
    func markAsDisplayed(tvShowId: Int) {
        displayedTVShowIds.insert(tvShowId)
    }
    
    func reset() {
        displayedMovieIds.removeAll()
        displayedTVShowIds.removeAll()
    }
    
    func getDisplayedCount() -> (movies: Int, tvShows: Int) {
        return (displayedMovieIds.count, displayedTVShowIds.count)
    }
}

