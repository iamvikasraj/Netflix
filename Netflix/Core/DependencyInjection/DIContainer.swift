//
//  DIContainer.swift
//  Netflix
//
//  Dependency Injection Container
//

import Foundation

@MainActor
class DIContainer {
    static let shared = DIContainer()
    
    // Services
    lazy var tmdbService: TMDBServiceProtocol = {
        TMDBService.shared
    }()
    
    // Repositories
    lazy var contentRepository: ContentRepositoryProtocol = {
        ContentRepository(tmdbService: tmdbService)
    }()
    
    // ViewModels
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(contentRepository: contentRepository, contentTracker: ContentTracker.shared)
    }
    
    func makeSectionViewModel(for section: HomeSection) -> SectionViewModel {
        return SectionViewModel(section: section, contentRepository: contentRepository, contentTracker: ContentTracker.shared)
    }
    
    // Content Tracker
    var contentTracker: ContentTracker {
        ContentTracker.shared
    }
    
    private init() {}
}

