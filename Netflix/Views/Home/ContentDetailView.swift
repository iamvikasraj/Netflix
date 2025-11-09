//
//  ContentDetailView.swift
//  Netflix
//
//  Created by Vikas Raj Yadav on 26/05/25.
//

import SwiftUI

/// Detail view for content (movies, shows, etc.) - presented as full-page overlay with scale-down background
struct ContentDetailView: View {
    @EnvironmentObject var router: AppRouter
    let contentId: String?
    
    init(contentId: String? = nil) {
        self.contentId = contentId
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // Fixed hero image card at top
            ZStack {
                // Placeholder for hero image
            }
            .frame(maxWidth: .infinity, minHeight: 221)
            .background(Color(red: 0.26, green: 0.22, blue: 0.13))
            .cornerRadius(10)
            .padding(.top, 10)
            .zIndex(1)
            
            // Scrollable content below hero card
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Spacer to account for fixed hero card
                    Spacer().frame(height: 241)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Young Sheldon")
                            .font(.system(size: 17, weight: .semibold))
                            .kerning(0.17)
                            .foregroundColor(.white)
                            .frame(width: 126, height: 22, alignment: .topLeading)
                        
                        HStack(alignment: .center, spacing: 7) {
                            Text("2021")
                                .font(.system(size: 13, weight: .semibold))
                                .kerning(0.39)
                                .foregroundColor(.white)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Text("U/A 13+")
                                    .font(.system(size: 8, weight: .semibold))
                                    .kerning(0.4)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .padding(3)
                            .background(Color(red: 0.3, green: 0.3, blue: 0.3))
                            .cornerRadius(2)
                            
                            Text("5 Seasons")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        
                        VStack(spacing: 10) {
                            HStack(alignment: .center, spacing: 10) {
                                Image("play")
                                    .frame(width: 19.05256, height: 22)
                                
                                Text("Play")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 0)
                            .padding(.vertical, 9)
                            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                            .background(.white)
                            .cornerRadius(4)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Image("download")
                                    .frame(width: 19.05256, height: 22)
                                
                                Text("Download")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 0)
                            .padding(.vertical, 9)
                            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                            .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                            .cornerRadius(4)
                        }
                        .padding(.top, 14)
                        .padding(.bottom, 24)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Brilliant yet awkward 9-year-old Sheldon Cooper Lands in high school where his smarts leave everyone stumped in this \"The Big Bang Theory\" spinoff.")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white)
                            Text("Cast: Iain Armitage, Zoe Perry, Lance Barber ... moree")
                                .font(.system(size: 11, weight: .semibold))
                                .kerning(0.22)
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            
                            Text("Creators: Chuck Lorre, Steve Molaro")
                                .font(.system(size: 11, weight: .medium))
                                .kerning(0.22)
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                        }
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .center, spacing: 6) {
                                Rectangle()
                                    .frame(width: 18, height: 18)
                                    .background(.gray)
                                
                                Text("My List")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(width: 35, alignment: .top)
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 6) {
                                Rectangle()
                                    .frame(width: 18, height: 18)
                                    .background(.gray)
                                
                                Text("Rate")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .padding(0)
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 6) {
                                Rectangle()
                                    .frame(width: 18, height: 18)
                                    .background(.gray)
                                
                                Text("My List")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(width: 35, alignment: .top)
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 6) {
                                Rectangle()
                                    .frame(width: 18, height: 18)
                                    .background(.gray)
                                
                                Text("My List")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(width: 35, alignment: .top)
                            
                            Spacer()
                        }
                        .foregroundColor(.clear)
                        .frame(height: 62)
                        .padding(.top, 21)
                        .background(.black)
                        
                        HStack(spacing: 24) {
                            Text("Episodes")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text("Collection")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            
                            Text("More Like This")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 20)
                }
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentDetailView()
        .environmentObject(AppRouter())
        .preferredColorScheme(.dark)
}
