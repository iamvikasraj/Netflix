//
//  FeaturedShowCard.swift
//  Netflix
//
//  Created by Vikas Raj Yadav on 10/11/25.
//

import SwiftUI

struct FeaturedShowCard: View {
    let imageName: String
    let title: String
    let subtitle: String
    let ratingBadge: String
    let seasonOrEpisodes: String
    let onPlayTapped: (() -> Void)?
    let onMyListTapped: (() -> Void)?
    
    init(
        imageName: String,
        title: String,
        subtitle: String,
        ratingBadge: String = "U/A 13+",
        seasonOrEpisodes: String = "8 Episodes",
        onPlayTapped: (() -> Void)? = nil,
        onMyListTapped: (() -> Void)? = nil
    ) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.ratingBadge = ratingBadge
        self.seasonOrEpisodes = seasonOrEpisodes
        self.onPlayTapped = onPlayTapped
        self.onMyListTapped = onMyListTapped
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 320)
                .clipped()
                .overlay(
                    LinearGradient(
                        colors: [Color.black.opacity(0.0), Color.black.opacity(0.75)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    Text(subtitle)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white.opacity(0.85))
                        .shadow(radius: 6)
                }
                
                HStack(spacing: 10) {
                    Text(ratingBadge)
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.18))
                        .cornerRadius(6)
                    
                    Text(seasonOrEpisodes)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                HStack(spacing: 12) {
                    Button {
                        onPlayTapped?()
                    } label: {
                        HStack(spacing: 10) {
                            Image("played")
                                .frame(width: 22, height: 22)
                            Text("Play")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        onMyListTapped?()
                    } label: {
                        HStack(spacing: 10) {
                            Image("mylist")
                                .frame(width: 22, height: 22)
                            Text("My List")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
        .shadow(color: Color.black.opacity(0.4), radius: 16, y: 8)
    }
}

#Preview {
    FeaturedShowCard(
        imageName: "dmc",
        title: "Devil May Cry",
        subtitle: "New Episodes Weekly"
    )
    .padding()
    .background(Color.black)
}

