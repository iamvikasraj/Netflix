//
//  SectionViewModel.swift
//  Netflix
//
//  ViewModel for content sections
//

import Foundation
import SwiftUI

@MainActor
class SectionViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var tvShows: [TVShow] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let contentRepository: ContentRepositoryProtocol
    private let section: HomeSection
    private let contentTracker: ContentTracker
    
    init(section: HomeSection, contentRepository: ContentRepositoryProtocol, contentTracker: ContentTracker) {
        self.section = section
        self.contentRepository = contentRepository
        self.contentTracker = contentTracker
    }
    
    convenience init(section: HomeSection, contentRepository: ContentRepositoryProtocol) {
        self.init(section: section, contentRepository: contentRepository, contentTracker: ContentTracker.shared)
    }
    
    func loadContent() async {
        isLoading = true
        errorMessage = nil
        
        do {
            switch section.contentType {
            case .movies:
                let fetchedMovies = try await contentRepository.fetchMovies(category: section.category)
                // Filter out already displayed movies
                movies = contentTracker.filterMovies(fetchedMovies)
            case .tvShows:
                let fetchedTVShows = try await contentRepository.fetchTVShows(category: section.category)
                // Filter out already displayed TV shows
                tvShows = contentTracker.filterTVShows(fetchedTVShows)
            }
        } catch {
            errorMessage = "Failed to load \(section.title): \(error.localizedDescription)"
            print("❌ \(errorMessage ?? "Unknown error")")
        }
        
        isLoading = false
    }
}

