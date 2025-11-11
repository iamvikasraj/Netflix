import SwiftUI

struct SmallCardSection: View {
    @State private var movies: [TMDBMovie] = []
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Mobile Games")
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("My List")
                    .font(.system(size: 16, weight: .regular))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    if isLoading {
                        ForEach(0..<5, id: \.self) { _ in
                            SmallCard()
                        }
                    } else {
                        ForEach(movies.prefix(5)) { movie in
                            SmallCard(
                                imageURL: movie.posterPath.flatMap { path in
                                    !path.isEmpty ? TMDBService.shared.posterURL(path: path) : nil
                                },
                                title: movie.title,
                                genre: "Action" // You can extract genre from movie data if available
                            )
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .scrollIndicators(.hidden)
        }
        .task {
            await loadMovies()
        }
    }
    
    private func loadMovies() async {
        isLoading = true
        do {
            movies = try await TMDBService.shared.fetchPopularMovies()
            isLoading = false
        } catch {
            print("❌ Error loading movies for SmallCardSection: \(error.localizedDescription)")
            isLoading = false
        }
    }
}

struct MediumCardSection: View {
    var title: String
    var cover: String
    @State private var movies: [TMDBMovie] = []
    @State private var tvShows: [TMDBTVShow] = []
    @State private var isLoading = true
    @State private var contentType: ContentType = .movies
    
    enum ContentType {
        case movies
        case tvShows
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    if isLoading {
                        ForEach(0..<5, id: \.self) { _ in
                            AsyncImageCard(imageURL: nil, width: 110, height: 159)
                        }
                    } else {
                        if contentType == .movies {
                            ForEach(movies.prefix(10)) { movie in
                                if let posterPath = movie.posterPath, !posterPath.isEmpty {
                                    AsyncImageCard(
                                        imageURL: TMDBService.shared.posterURL(path: posterPath),
                                        width: 110,
                                        height: 159
                                    )
                                } else {
                                    AsyncImageCard(imageURL: nil, width: 110, height: 159)
                                }
                            }
                        } else {
                            ForEach(tvShows.prefix(10)) { show in
                                if let posterPath = show.posterPath, !posterPath.isEmpty {
                                    AsyncImageCard(
                                        imageURL: TMDBService.shared.posterURL(path: posterPath),
                                        width: 110,
                                        height: 159
                                    )
                                } else {
                                    AsyncImageCard(imageURL: nil, width: 110, height: 159)
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .scrollIndicators(.hidden)
        }
        .task {
            await loadContent()
        }
    }
    
    private func loadContent() async {
        isLoading = true
        do {
            let category = getCategoryForTitle(title)
            
            switch category {
            case .trending:
                movies = try await TMDBService.shared.fetchTrendingMovies()
                contentType = .movies
            case .topSearches:
                movies = try await TMDBService.shared.fetchPopularMovies()
                contentType = .movies
            case .tvShows:
                tvShows = try await TMDBService.shared.fetchTrendingTVShows()
                contentType = .tvShows
            case .topRatedTV:
                tvShows = try await TMDBService.shared.fetchTopRatedTVShows()
                contentType = .tvShows
            case .nowPlaying:
                movies = try await TMDBService.shared.fetchNowPlayingMovies()
                contentType = .movies
            case .upcoming:
                movies = try await TMDBService.shared.fetchUpcomingMovies()
                contentType = .movies
            case .action:
                movies = try await TMDBService.shared.fetchMoviesByGenre(genreId: 28)
                contentType = .movies
            case .comedy:
                movies = try await TMDBService.shared.fetchMoviesByGenre(genreId: 35)
                contentType = .movies
            case .drama:
                movies = try await TMDBService.shared.fetchMoviesByGenre(genreId: 18)
                contentType = .movies
            case .family:
                movies = try await TMDBService.shared.fetchMoviesByGenre(genreId: 10751)
                contentType = .movies
            case .thriller:
                movies = try await TMDBService.shared.fetchMoviesByGenre(genreId: 53)
                contentType = .movies
            case .romance:
                movies = try await TMDBService.shared.fetchMoviesByGenre(genreId: 10749)
                contentType = .movies
            case .topRated:
                movies = try await TMDBService.shared.fetchTopRatedMovies()
                contentType = .movies
            case .popular:
                movies = try await TMDBService.shared.fetchPopularMovies()
                contentType = .movies
            }
            
            isLoading = false
        } catch {
            print("❌ Error loading content for '\(title)': \(error.localizedDescription)")
            isLoading = false
        }
    }
    
    private enum Category {
        case trending, topSearches, tvShows, topRatedTV, nowPlaying, upcoming
        case action, comedy, drama, family, thriller, romance
        case topRated, popular
    }
    
    private func getCategoryForTitle(_ title: String) -> Category {
        let lowerTitle = title.lowercased()
        
        if lowerTitle.contains("tv show") || lowerTitle.contains("emmy") {
            return .tvShows
        } else if lowerTitle.contains("top 10") && lowerTitle.contains("tv") {
            return .topRatedTV
        } else if lowerTitle.contains("top searches") {
            return .topSearches
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

struct BigCardSection: View {
    var title: String
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<9) { _ in
                        BigCard()
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct TopTenCardSection: View {
    var title: String
    @State private var movies: [TMDBMovie] = []
    @State private var tvShows: [TMDBTVShow] = []
    @State private var isLoading = true
    @State private var isTVShows = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    if isLoading {
                        ForEach(1...10, id: \.self) { rank in
                            TopTenCard(rank: rank, imageURL: nil)
                        }
                    } else {
                        if isTVShows {
                            ForEach(Array(tvShows.prefix(10).enumerated()), id: \.element.id) { index, show in
                                TopTenCard(
                                    rank: index + 1,
                                    imageURL: show.posterPath.flatMap { path in
                                        !path.isEmpty ? TMDBService.shared.posterURL(path: path) : nil
                                    }
                                )
                            }
                        } else {
                            ForEach(Array(movies.prefix(10).enumerated()), id: \.element.id) { index, movie in
                                TopTenCard(
                                    rank: index + 1,
                                    imageURL: movie.posterPath.flatMap { path in
                                        !path.isEmpty ? TMDBService.shared.posterURL(path: path) : nil
                                    }
                                )
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .scrollIndicators(.hidden)
        }
        .task {
            await loadContent()
        }
    }
    
    private func loadContent() async {
        isLoading = true
        do {
            let lowerTitle = title.lowercased()
            
            if lowerTitle.contains("tv show") || lowerTitle.contains("tv") {
                tvShows = try await TMDBService.shared.fetchTopRatedTVShows()
                isTVShows = true
                print("✅ Loaded \(tvShows.count) top rated TV shows")
            } else {
                movies = try await TMDBService.shared.fetchTopRatedMovies()
                isTVShows = false
                print("✅ Loaded \(movies.count) top rated movies")
            }
            isLoading = false
        } catch {
            print("❌ Error loading top rated content: \(error.localizedDescription)")
            isLoading = false
        }
    }
}

struct NotificationSection: View {
    
    var SectionName: String = ""
    var SectionColor: Color = Color.red
    
    var body: some View {
        VStack (spacing: 20) {
            HStack(alignment: .center)
            {
                HStack(alignment: .center, spacing: 8) {
                    ZStack {  }
                        .frame(width: 44, height: 44)
                        .background(SectionColor)
                        .cornerRadius(50)
                    
                    Text(SectionName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                Spacer()
                Image("right")
                    .frame(width: 12, height: 22)
            }
            .padding(0)
            
            NotificationCard(Title: "Coming Soon", Subtext: "Play the trailer", Date: "Tomorrow")
            
            NotificationCard(Title: "Coming Soon", Subtext: "Play the trailer", Date: "Tomorrow")
        }
        .frame(width: 377, alignment: .center)
        .padding(.top, 24)
    }
}

struct DownloadsSection: View {
    
    var SectionName: String = ""
    var SectionColor: Color = Color.red
    
    var body: some View {
        VStack (spacing: 20) {
            HStack(alignment: .center)
            {
                HStack(alignment: .center, spacing: 8) {
                    ZStack {  }
                        .frame(width: 44, height: 44)
                        .background(SectionColor)
                        .cornerRadius(50)
                    
                    Text(SectionName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                Spacer()
                Image("right")
                    .frame(width: 12, height: 22)
            }
            .padding(0)
        }
        .frame(width: 377, alignment: .center)
        .padding(.top, 24)
    }
}

struct ProfileCardSection: View {
    var title: String
    @State private var movies: [TMDBMovie] = []
    @State private var isLoading = true
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    if isLoading {
                        ForEach(0..<5, id: \.self) { _ in
                            AsyncImageCard(imageURL: nil, width: 110, height: 159)
                        }
                    } else {
                        ForEach(movies.prefix(5)) { movie in
                            if let posterPath = movie.posterPath, !posterPath.isEmpty {
                                AsyncImageCard(
                                    imageURL: TMDBService.shared.posterURL(path: posterPath),
                                    width: 110,
                                    height: 159
                                )
                            } else {
                                // Fallback for movies without posters
                                AsyncImageCard(imageURL: nil, width: 110, height: 159)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 8)
                .padding(.trailing, 8)
            }
            .scrollIndicators(.hidden)
        }
        .task {
            await loadMovies()
        }
    }
    
    private func loadMovies() async {
        isLoading = true
        do {
            movies = try await TMDBService.shared.fetchPopularMovies()
            print("✅ Loaded \(movies.count) popular movies")
            isLoading = false
        } catch {
            print("❌ Error loading movies: \(error.localizedDescription)")
            if let tmdbError = error as? TMDBError {
                print("TMDB Error: \(tmdbError.localizedDescription)")
            }
            isLoading = false
        }
    }
}

