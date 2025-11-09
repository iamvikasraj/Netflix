//
//  HomeViewModel.swift
//  Netflix
//
//  ViewModel for HomeView
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var sections: [HomeSection] = []
    @Published var heroContent: Movie?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let contentRepository: ContentRepositoryProtocol
    private let contentTracker: ContentTracker
    
    init(contentRepository: ContentRepositoryProtocol, contentTracker: ContentTracker) {
        self.contentRepository = contentRepository
        self.contentTracker = contentTracker
    }
    
    convenience init(contentRepository: ContentRepositoryProtocol) {
        self.init(contentRepository: contentRepository, contentTracker: ContentTracker.shared)
    }
    
    func loadContent() async {
        isLoading = true
        errorMessage = nil
        
        // Reset tracker when loading new content
        contentTracker.reset()
        
        // Set sections on MainActor
        sections = HomeSection.defaultSections
        
        // Load hero content (trending movie)
        do {
            let trendingMovies = try await contentRepository.fetchMovies(category: .trending)
            if let firstMovie = trendingMovies.first {
                heroContent = firstMovie
                // Mark hero content as displayed
                contentTracker.markAsDisplayed(movieId: firstMovie.id)
            }
        } catch {
            errorMessage = "Failed to load hero content: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

