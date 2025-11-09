# Netflix App Architecture

## Overview
This app follows the **MVVM (Model-View-ViewModel)** architecture pattern with clean architecture principles, ensuring separation of concerns, testability, and maintainability.

## Architecture Layers

### 1. Domain Layer (`Core/Domain/`)
Contains business logic and domain models:
- **Models**: `ContentItem`, `Movie`, `TVShow`, `ContentCategory`, `HomeSection`
- Pure Swift types with no dependencies on frameworks
- Defines the business rules and entities

### 2. Data Layer (`Core/Data/`)
Handles data access and external services:
- **Repository**: `ContentRepository` - Abstracts data sources
- **Services**: `TMDBService` - Handles API calls to The Movie Database
- Converts external data models (TMDB) to domain models

### 3. Presentation Layer (`Core/Presentation/`)
Contains ViewModels and UI logic:
- **ViewModels**: `HomeViewModel`, `SectionViewModel`
- Manages view state and business logic
- Uses `@Published` properties for reactive updates
- Uses `@MainActor` for thread safety

### 4. Dependency Injection (`Core/DependencyInjection/`)
- **DIContainer**: Centralized dependency management
- Provides instances of services, repositories, and ViewModels
- Enables easy testing with mock dependencies

### 5. Navigation (`Core/Navigation/`)
- **NavigationCoordinator**: Manages app-wide navigation
- Uses SwiftUI's `NavigationPath` for type-safe navigation
- Centralized routing logic

## Data Flow

```
View → ViewModel → Repository → Service → API
  ↑                                    ↓
  └─────────── Domain Models ──────────┘
```

1. **View** observes ViewModel's `@Published` properties
2. **ViewModel** calls Repository methods
3. **Repository** uses Service to fetch data
4. **Service** makes API calls and returns raw data
5. **Repository** converts to Domain models
6. **ViewModel** updates `@Published` properties
7. **View** automatically updates via SwiftUI's reactive system

## Key Components

### ViewModels
- `HomeViewModel`: Manages home screen state and hero content
- `SectionViewModel`: Manages individual content section state

### Repositories
- `ContentRepository`: Provides unified interface for content data
- Abstracts away data source details (currently TMDB API)

### Models
- `Movie`: Domain model for movies
- `TVShow`: Domain model for TV shows
- `ContentCategory`: Enum for content categories
- `HomeSection`: Defines sections on home screen

## Benefits

1. **Testability**: Each layer can be tested independently
2. **Maintainability**: Clear separation of concerns
3. **Scalability**: Easy to add new features
4. **Reusability**: Components can be reused across views
5. **Type Safety**: Strong typing throughout the app

## Usage Example

```swift
// In a View
@StateObject private var viewModel = DIContainer.shared.makeHomeViewModel()

// ViewModel automatically loads data
.task {
    await viewModel.loadContent()
}

// View reacts to ViewModel changes
if viewModel.isLoading {
    ProgressView()
} else {
    ForEach(viewModel.sections) { section in
        ContentSectionView(section: section)
    }
}
```

## Future Improvements

1. Add caching layer for offline support
2. Implement pagination for sections
3. Add error handling UI
4. Implement search functionality
5. Add favorites/watchlist feature
6. Add detail view navigation

