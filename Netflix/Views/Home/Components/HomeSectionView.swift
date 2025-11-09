//
//  HomeSectionView.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

struct HomeSectionView: View {
    @EnvironmentObject var router: AppRouter
    let section: HomeSection
    
    var body: some View {
        Group {
            switch section.type {
            case .smallCard:
                SmallCardSection()
                
            case .mediumCard(let items):
                MediumCardSection(
                    title: section.title,
                    cover: section.cover ?? "one-4",
                    items: items
                )
                
            case .topTen:
                TopTenCardSection(title: section.title)
            }
        }
    }
}

#Preview {
    HomeSectionView(section: HomeSection.sampleSections[1])
        .environmentObject(AppRouter())
        .preferredColorScheme(.dark)
        .background(Color.black)
}

