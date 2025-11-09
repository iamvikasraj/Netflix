//
//  HeroCard.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

struct HeroCard: View {
    @EnvironmentObject var router: AppRouter
    let imageName: String
    let contentId: String?
    let onPlay: () -> Void
    let onMyList: () -> Void
    
    init(imageName: String, contentId: String? = nil, onPlay: @escaping () -> Void, onMyList: @escaping () -> Void) {
        self.imageName = imageName
        self.contentId = contentId
        self.onPlay = onPlay
        self.onMyList = onMyList
    }
    
    var body: some View {
        ZStack {
            // Background image - tappable area
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 345, height: 486)
                .clipped()
                .cornerRadius(16)
                .onTapGesture {
                    // Present detail view as bottom sheet
                    if let contentId = contentId {
                        router.presentSheet(.contentDetail(id: contentId, type: .movie))
                    }
                }
            
            // Buttons overlay at bottom
            VStack {
                Spacer()
                HStack {
                    // Play Button
                    Button(action: {
                        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                        impactFeedback.impactOccurred()
                        onPlay()
                    }) {
                        HStack(alignment: .center, spacing: 10) {
                            Image("played")
                                .frame(width: 22, height: 22)
                            
                            Text("Play")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 0)
                        .padding(.vertical, 9)
                        .frame(maxWidth: 151, maxHeight: 42)
                        .glassEffect(in: .rect(cornerRadius: 4))
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // My List Button
                    Button(action: {
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.impactOccurred()
                        onMyList()
                    }) {
                        HStack(alignment: .center, spacing: 10) {
                            Image("mylist")
                                .frame(width: 22, height: 22)
                            
                            Text("My List")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 0)
                        .padding(.vertical, 9)
                        .frame(maxWidth: 151, maxHeight: 42)
                        .glassEffect(in: .rect(cornerRadius: 4))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 16)
                .padding(.top, 16)
            }
        }
        .frame(width: 345, height: 486)
        .drawingGroup()
    }
}

#Preview {
    HeroCard(
        imageName: "hero",
        contentId: "hero-1",
        onPlay: {
            print("Play tapped")
        },
        onMyList: {
            print("My List tapped")
        }
    )
    .environmentObject(AppRouter())
    .preferredColorScheme(.dark)
    .background(Color.black)
}

