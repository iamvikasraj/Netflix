//
//  MainCardView.swift
//  Netflix
//
//  Created by Vikas Raj Yadav on 26/05/25.
//

import SwiftUI

struct MainCardView: View {
    @Environment(\.dismiss) var dismiss
    
    // Sample episodes data - in a real app, this would come from a view model or API
    private let episodes = Episode.sampleEpisodes
    
    var body: some View {
        ZStack {
            // Black background that extends to all edges
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing:0) {
                
                ZStack {
                    
                }
                .frame(maxWidth: .infinity, minHeight: 221)
                .background(Color(red: 0.26, green: 0.22, blue: 0.13))
                
                
                ScrollView() {
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Devil May Cry")
                                .font(.system(size: 17, weight: .semibold))
                                .kerning(0.17)
                                .foregroundColor(.white)
                                .frame(width: 126, height: 22, alignment: .topLeading)
                            
                            HStack(alignment: .center, spacing: 7) {
                                Text("2025")
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
                                
                                Text("8 Episodes")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            
                            VStack (spacing: 10) {
                            Button(action: {
                                // TODO: Handle play action
                                print("Play tapped")
                            }) {
                                HStack(alignment: .center, spacing: 10) {
                                    Image("play")
                                        .frame(width: 19.05256, height: 22)
                                    
                                    Text("Play")
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal, 0)
                                .padding(.vertical, 9)
                                .frame(width: 382, height: 40, alignment: .center)
                                .background(.white)
                                .cornerRadius(4)
                            }
                            .buttonStyle(.plain)
                            
                            Button(action: {
                                // TODO: Handle download action
                                print("Download tapped")
                            }) {
                                HStack(alignment: .center, spacing: 10) {
                                    Image("download")
                                        .frame(width: 19.05256, height: 22)
                                    
                                    Text("Download")
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 0)
                                .padding(.vertical, 9)
                                .frame(width: 382, height: 40, alignment: .center)
                                .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                                .cornerRadius(4)
                            }
                            .buttonStyle(.plain)
                            }
                            .padding(.top, 14)
                            .padding(.bottom,24)
                            
                            
                            VStack (alignment: .leading, spacing: 7) {
                                Text("All Hope Abandon")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.white)
                                Text("The amulet's signal leads DARKCOM to a run-down apartment building. But is it really the Rabbit's lair... or a trap? Dante learns his true origins.")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Cast: Iain Armitage, Zoe Perry, Lance Barber ... more")
                                    .font(.system(size: 11, weight: .semibold))
                                    .kerning(0.22)
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                                
                                Text("Creators: Adi Shankar")
                                    .font(
                                        Font.custom("Inter", size: 11)
                                            .weight(.medium)
                                    )
                                    .kerning(0.22)
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            }
                            
                            HStack (){
                                VStack(alignment: .center, spacing: 6) {
                                    Image("my list")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    Text("My List")
                                        .font(
                                            Font.custom("Inter", size: 11)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .padding(0)
                                .frame(width: .infinity, alignment: .top)
                                
                                VStack(alignment: .center, spacing: 6) {
                                    Image("rate")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    Text("Rate")
                                        .font(
                                            Font.custom("Inter", size: 11)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .padding(0)
                                .frame(width: .infinity, alignment: .top)
                            
                                VStack(alignment: .center, spacing: 6) {
                                    Image("share_2")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    Text("Share")
                                        .font(
                                            Font.custom("Inter", size: 11)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .padding(0)
                                .frame(width: .infinity, alignment: .top)
                                
                                Button(action: {
                                    // TODO: Handle secondary download action
                                    print("Secondary download tapped")
                                }) {
                                    VStack(alignment: .center, spacing: 6) {
                                        Image("download_2")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        
                                        Text("download")
                                            .font(
                                                Font.custom("Inter", size: 11)
                                                    .weight(.medium)
                                            )
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    .padding(0)
                                    .frame(width: .infinity, alignment: .top)
                                }
                                .buttonStyle(.plain)
                            }
                            .foregroundColor(.clear)
                            .frame(height: 62)
                            .padding(.top, 21)
                            .padding(.horizontal,24)
                            .background(.black)
                            
                            HStack(spacing:24) {
                                Text("Episodes")
                                    .font(
                                        Font.custom("Inter", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.white)
                                
                                Text("Collection")
                                    .font(
                                        Font.custom("Inter", size: 15)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                                
                                Text("More Like This")
                                    .font(
                                        Font.custom("Inter", size: 15)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            }
                            
                            VStack(){
                                HStack(){
                                    Text("Devil May Cry")
                                      .font(Font.custom("Inter", size: 15))
                                      .kerning(0.15)
                                      .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                                    Spacer()
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom,20)
                                
                                // Display all episodes
                                ForEach(episodes) { episode in
                                    EpisodeCard(episode: episode)
                                        .padding(.bottom, 16)
                                }
                            }
                            .padding(.top,32)
                            
                            
                        }
                        .padding(10)
                        Spacer()
                    }
                }
            }
        }
    }
        
}

#Preview {
    MainCardView()
}
