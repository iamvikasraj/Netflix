//
//  RouteView.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

/// View that handles routing to different destinations
struct RouteView: View {
    let route: Route
    
    var body: some View {
        switch route {
        case .movieDetail(let id):
            MovieDetailView(contentId: id)
        case .showDetail(let id):
            ShowDetailView(contentId: id)
        case .gameDetail(let id):
            GameDetailView(contentId: id)
        case .contentDetail(let id, _):
            ContentDetailView(contentId: id)
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        case .myList:
            MyListView()
        case .downloads:
            DownloadsView()
        case .search:
            SearchView()
        case .searchResults(let query):
            SearchResultsView(query: query)
        case .category(let name):
            CategoryView(categoryName: name)
        case .seasonDetail(let showId, let seasonNumber):
            SeasonDetailView(showId: showId, seasonNumber: seasonNumber)
        case .episodeDetail(let showId, let seasonNumber, let episodeNumber):
            EpisodeDetailView(showId: showId, seasonNumber: seasonNumber, episodeNumber: episodeNumber)
        case .player(let contentId):
            PlayerView(contentId: contentId)
        }
    }
}

// MARK: - Placeholder Views (to be implemented)
struct MovieDetailView: View {
    let contentId: String
    var body: some View {
        ContentDetailView(contentId: contentId)
    }
}

struct ShowDetailView: View {
    let contentId: String
    var body: some View {
        ContentDetailView(contentId: contentId)
    }
}

struct GameDetailView: View {
    let contentId: String
    var body: some View {
        Text("Game Detail: \(contentId)")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

// ContentDetailView is now in Views/home/ContentDetailView.swift

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct MyListView: View {
    var body: some View {
        Text("My List")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DownloadsView: View {
    var body: some View {
        Text("Downloads")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchResultsView: View {
    let query: String
    var body: some View {
        Text("Search Results: \(query)")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryView: View {
    let categoryName: String
    var body: some View {
        Text("Category: \(categoryName)")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SeasonDetailView: View {
    let showId: String
    let seasonNumber: Int
    var body: some View {
        Text("Season \(seasonNumber) of \(showId)")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct EpisodeDetailView: View {
    let showId: String
    let seasonNumber: Int
    let episodeNumber: Int
    var body: some View {
        Text("Episode \(episodeNumber) of Season \(seasonNumber)")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlayerView: View {
    let contentId: String
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Playing: \(contentId)")
                .foregroundColor(.white)
        }
    }
}

