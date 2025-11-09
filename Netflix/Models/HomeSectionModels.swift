//
//  HomeSectionData.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

/// Represents different types of sections in the home view
enum HomeSectionType {
    case smallCard
    case mediumCard(items: [CardItem]?)
    case topTen
}

/// Data model for home sections
struct HomeSection: Identifiable {
    let id: String
    let title: String
    let type: HomeSectionType
    let cover: String?
    
    init(id: String = UUID().uuidString, title: String, type: HomeSectionType, cover: String? = nil) {
        self.id = id
        self.title = title
        self.type = type
        self.cover = cover
    }
}

/// Sample data for home sections
extension HomeSection {
    static var sampleSections: [HomeSection] {
        [
            HomeSection(
                title: "Mobile Games",
                type: .smallCard
            ),
            HomeSection(
                title: "Top Searches",
                type: .mediumCard(items: [
                    CardItem(id: "1", imageName: "witcher", contentId: "witcher-1", contentType: .show),
                    CardItem(id: "2", imageName: "you", contentId: "you-1", contentType: .show),
                    CardItem(id: "3", imageName: "dearchild", contentId: "dearchild-1", contentType: .movie),
                    CardItem(id: "4", imageName: "madness", contentId: "madness-1", contentType: .show),
                    CardItem(id: "5", imageName: "bodyproblem", contentId: "bodyproblem-1", contentType: .show)
                ]),
                cover: "one-1"
            ),
            HomeSection(
                title: "Emmy - Winning US TV Shows",
                type: .mediumCard(items: nil),
                cover: "one-2"
            ),
            HomeSection(
                title: "Movies & TV Shows Dubbed in Tamil",
                type: .mediumCard(items: nil),
                cover: "one-3"
            ),
            HomeSection(
                title: "Top 10 Movies in India Today",
                type: .topTen
            ),
            HomeSection(
                title: "We Think You'll Love These",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Continue Watching for Rocky",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Top 10 TV Shows in India Today",
                type: .topTen
            ),
            HomeSection(
                title: "Activating Beast Mode",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "New on Netflix",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Critcially Acclaimed Movies",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Get it on the Action",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Exsiting US TV Shows",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Hollywood Movies",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Todays Top Pick for You",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Witty US TV Comedy Shows",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Your Next Watch",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Because you watch Minions & More",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Emotional Movies",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Epic Worlds",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Comedies",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Children & Family Movies",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Crowd Pleasers",
                type: .mediumCard(items: nil),
                cover: "one-4"
            ),
            HomeSection(
                title: "Young Adult Movies & Shows",
                type: .mediumCard(items: nil),
                cover: "one-4"
            )
        ]
    }
}

