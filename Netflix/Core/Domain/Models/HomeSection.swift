//
//  HomeSection.swift
//  Netflix
//
//  Domain model for home page sections
//

import Foundation

struct HomeSection: Identifiable {
    let id: String
    let title: String
    let category: ContentCategory
    let contentType: ContentType
    
    enum ContentType: Hashable {
        case movies
        case tvShows
    }
    
    static let defaultSections: [HomeSection] = [
        HomeSection(id: "trending", title: "Trending Now", category: .trending, contentType: .movies),
        HomeSection(id: "top-searches", title: "Top Searches", category: .popular, contentType: .movies),
        HomeSection(id: "tv-shows", title: "Emmy - Winning US TV Shows", category: .tvShows, contentType: .tvShows),
        HomeSection(id: "tamil", title: "Movies & TV Shows Dubbed in Tamil", category: .popular, contentType: .movies),
        HomeSection(id: "top-10-movies", title: "Top 10 Movies in India Today", category: .topRated, contentType: .movies),
        HomeSection(id: "recommendations", title: "We Think You'll Love These", category: .popular, contentType: .movies),
        HomeSection(id: "continue-watching", title: "Continue Watching for Rocky", category: .trending, contentType: .movies),
        HomeSection(id: "top-10-tv", title: "Top 10 TV Shows in India Today", category: .topRatedTV, contentType: .tvShows),
        HomeSection(id: "action", title: "Activating Beast Mode", category: .action, contentType: .movies),
        HomeSection(id: "new", title: "New on Netflix", category: .upcoming, contentType: .movies),
        HomeSection(id: "critically-acclaimed", title: "Critically Acclaimed Movies", category: .topRated, contentType: .movies),
        HomeSection(id: "action-genre", title: "Get it on the Action", category: .action, contentType: .movies),
        HomeSection(id: "us-tv", title: "Existing US TV Shows", category: .tvShows, contentType: .tvShows),
        HomeSection(id: "hollywood", title: "Hollywood Movies", category: .popular, contentType: .movies),
        HomeSection(id: "top-pick", title: "Today's Top Pick for You", category: .trending, contentType: .movies),
        HomeSection(id: "comedy", title: "Witty US TV Comedy Shows", category: .comedy, contentType: .tvShows),
        HomeSection(id: "next-watch", title: "Your Next Watch", category: .popular, contentType: .movies),
        HomeSection(id: "similar", title: "Because you watch Minions & More", category: .popular, contentType: .movies),
        HomeSection(id: "emotional", title: "Emotional Movies", category: .drama, contentType: .movies),
        HomeSection(id: "epic", title: "Epic Worlds", category: .sciFi, contentType: .movies),
        HomeSection(id: "comedies", title: "Comedies", category: .comedy, contentType: .movies),
        HomeSection(id: "family", title: "Children & Family Movies", category: .family, contentType: .movies),
        HomeSection(id: "crowd-pleasers", title: "Crowd Pleasers", category: .popular, contentType: .movies),
        HomeSection(id: "young-adult", title: "Young Adult Movies & Shows", category: .popular, contentType: .movies)
    ]
}

