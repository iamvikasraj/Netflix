//
//  Episode.swift
//  Netflix
//
//  Domain model for TV show episodes
//

import Foundation

struct Episode: Identifiable, Hashable, Codable {
    let id: Int
    let episodeNumber: Int
    let title: String
    let duration: String
    let description: String
    let imageName: String?
    let imageURL: URL?
    
    init(
        id: Int,
        episodeNumber: Int,
        title: String,
        duration: String,
        description: String,
        imageName: String? = nil,
        imageURL: URL? = nil
    ) {
        self.id = id
        self.episodeNumber = episodeNumber
        self.title = title
        self.duration = duration
        self.description = description
        self.imageName = imageName
        self.imageURL = imageURL
    }
    
    // Computed property for formatted episode title
    var formattedTitle: String {
        "\(episodeNumber). \(title)"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        lhs.id == rhs.id
    }
}

// Sample data for preview/testing
// TODO: Replace with your actual episode data
extension Episode {
    static let sampleEpisodes: [Episode] = [
        Episode(
            id: 1,
            episodeNumber: 1,
            title: "Inferno",
            duration: "30m",
            description: "A break-in at the Vatican Museums by the White Rabbit sets off a chain reaction, as demon hunter Dante is pulled into a war on the barrier between worlds."
        ),
        Episode(
            id: 2,
            episodeNumber: 2,
            title: "Our Lady of Sorrows",
            duration: "32m",
            description: "With the amulet’s signal leading to a decaying apartment block, Dante races to find the Rabbit’s lair and begins to uncover his own origins."
        ),
        Episode(
            id: 3,
            episodeNumber: 3,
            title: "The Deep and Savage Way",
            duration: "30m",
            description: "Hunted by DARKCOM and pursued by demons from Hell, Dante is forced into an uneasy alliance and uncovers the deeper stakes behind the invasion."
        ),
        Episode(
            id: 4,
            episodeNumber: 4,
            title: "All Hope Abandon",
            duration: "30m",
            description: "As the Rabbit’s plan accelerates, Dante faces a brutal confrontation that reveals DARKCOM’s darkest secrets—and his connection to them."
        ),
        Episode(
            id: 5,
            episodeNumber: 5,
            title: "Descent",
            duration: "30m",
            description: "Mary discovers a hidden lab tied to the Rabbit’s experiments; Dante embraces his demonic heritage to save hostages and a hidden truth emerges."
        ),
        Episode(
            id: 6,
            episodeNumber: 6,
            title: "The First …",
            duration: "30m",
            description: "Dante and Mary’s trust is tested when a key figure from the past resurfaces; the Rabbit prepares a move that could fracture both worlds."
        ),
        Episode(
            id: 7,
            episodeNumber: 7,
            title: "… and Lasting",
            duration: "30m",
            description: "In a decisive showdown, the Rabbit unmasks his motivations, Dante accepts his legacy, and the war between realms puts everything on the line."
        ),
        Episode(
            id: 8,
            episodeNumber: 8,
            title: "One For All, All For One",
            duration: "30m",
            description: "The barriers break, alliances shatter and a final gamble begins: Dante must fight not just for Earth, but for the fate of both realms."
        )
    ]
}


