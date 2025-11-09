//
//  ContentModels.swift
//  Netflix
//
//  Created on 09/11/25.
//

import Foundation

/// Content type for routing and categorization
enum ContentType: String, Hashable {
    case movie
    case show
    case game
}

/// Represents a card item with content information
struct CardItem: Identifiable {
    let id: String
    let imageName: String
    let contentId: String?
    let contentType: ContentType?
}

