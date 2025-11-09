# TMDB API Integration Guide

## Getting Started

1. **Get a free API key:**
   - Go to https://www.themoviedb.org/
   - Sign up for a free account
   - Navigate to Settings > API
   - Request an API key (it's free and instant for development)

2. **Add your API key:**
   - Open `Netflix/Services/TMDBService.swift`
   - Replace `YOUR_API_KEY_HERE` with your actual API key

## Usage Examples

### Fetching Trending Movies

```swift
Task {
    do {
        let movies = try await TMDBService.shared.fetchTrendingMovies()
        // Use movies array
    } catch {
        print("Error: \(error)")
    }
}
```

### Using AsyncImageCard

```swift
// In your view
AsyncImageCard(
    imageURL: TMDBService.shared.posterURL(path: movie.posterPath ?? ""),
    width: 110,
    height: 159
)
```

### Example: Update MediumCardSection

```swift
struct MediumCardSection: View {
    @State private var movies: [TMDBMovie] = []
    
    var body: some View {
        VStack(spacing: 0) {
            // ... title ...
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(movies) { movie in
                        TMDBMediumCard(movie: movie)
                    }
                }
            }
        }
        .task {
            do {
                movies = try await TMDBService.shared.fetchTrendingMovies()
            } catch {
                print("Error loading movies: \(error)")
            }
        }
    }
}
```

## Available Endpoints

- `fetchTrendingMovies()` - Trending movies of the day
- `fetchTrendingTVShows()` - Trending TV shows of the day
- `fetchPopularMovies()` - Popular movies
- `fetchTopRatedMovies()` - Top rated movies
- `search(query:)` - Search for movies and TV shows

## Image Sizes

Poster sizes: `w92`, `w154`, `w185`, `w342`, `w500`, `w780`, `original`
Backdrop sizes: `w300`, `w780`, `w1280`, `original`

## Resources

- TMDB API Documentation: https://developers.themoviedb.org/3
- API Key: https://www.themoviedb.org/settings/api

