//
//  EpisodeCard.swift
//  Netflix
//
//  Created by Vikas Raj Yadav on 26/05/25.
//

import SwiftUI

struct EpisodeCard: View {
    let episodeTitle: String
    let duration: String
    let description: String
    let imageName: String?
    let imageURL: URL?
    
    init(episodeTitle: String, duration: String, description: String, imageName: String? = nil, imageURL: URL? = nil) {
        self.episodeTitle = episodeTitle
        self.duration = duration
        self.description = description
        self.imageName = imageName
        self.imageURL = imageURL
    }
    
    // Convenience initializer that accepts an Episode model
    init(episode: Episode) {
        self.episodeTitle = episode.formattedTitle
        self.duration = episode.duration
        self.description = episode.description
        self.imageName = episode.imageName
        self.imageURL = episode.imageURL
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 12) {
                // Episode thumbnail
                Group {
                    if let imageURL = imageURL {
                        AsyncImage(url: imageURL) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 114, height: 64)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 114, height: 64)
                                    .clipped()
                            case .failure:
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 114, height: 64)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else if let imageName = imageName {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 114, height: 64)
                            .clipped()
                    } else {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 114, height: 64)
                            .background(.white).opacity(0.1)
                    }
                }
                .cornerRadius(4)
                .padding(.bottom, 8)
                
                // Episode info
                VStack(alignment: .leading) {
                    Text(episodeTitle)
                        .font(
                            Font.custom("Inter", size: 14)
                                .weight(.medium)
                        )
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                    
                    Text(duration)
                        .font(
                            Font.custom("SF Pro", size: 12)
                                .weight(.medium)
                        )
                        .kerning(0.12)
                        .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                }
                
                Spacer()
                
                // Download button
                Button(action: {
                    // Add download action here
                    print("Download episode: \(episodeTitle)")
                }) {
                    Image("download")
                        .frame(width: 19.05256, height: 22)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            // Episode description
            Text(description)
                .font(
                    Font.custom("SF Pro", size: 13)
                        .weight(.medium)
                )
                .kerning(0.13)
                .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    VStack {
        EpisodeCard(episode: Episode.sampleEpisodes[0])
        EpisodeCard(episode: Episode.sampleEpisodes[1])
    }
    .background(.black)
    .padding()
}

