import SwiftUI

struct SmallCardSection: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Mobile Games")
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("My List")
                    .font(.system(size: 16, weight: .regular))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<5, id: \.self) { _ in
                        SmallCard()
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
        }
    }
}

struct MediumCardSection: View {
    @EnvironmentObject var router: AppRouter
    var title: String
    var cover: String
    var items: [CardItem]? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    if let items = items {
                        ForEach(items, id: \.id) { item in
                            MediumCard(
                                imageName: item.imageName,
                                contentId: item.contentId,
                                contentType: item.contentType
                            ) {
                                // Navigate based on content type
                                if let contentType = item.contentType, let contentId = item.contentId {
                                    router.presentSheet(.contentDetail(id: contentId, type: contentType))
                                }
                            }
                        }
                    } else {
                        // Fallback to default cards
                        MediumCard(imageName: "witcher")
                        MediumCard(imageName: "you")
                        MediumCard(imageName: "dearchild")
                        MediumCard(imageName: "madness")
                        MediumCard(imageName: "bodyproblem")
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
}

// CardItem moved to Models/ContentModels.swift

struct BigCardSection: View {
    var title: String
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<9, id: \.self) { _ in
                        BigCard()
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
        }
    }
}

struct TopTenCardSection: View {
    var title: String
    
    // Available cover images
    private let coverImages = [
        "witcher", "bodyproblem", "dearchild", "madness", "you",
        "movie_1", "movie_2", "movie_3", "movie_4", "movie_5",
        "movie_6", "movie_7", "movie_8", "kungfu4",
        "game_0", "game_1", "game_2", "game_3", "game_4"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(1...10, id: \.self) { rank in
                        TopTenCard(
                            rank: rank,
                            imageName: coverImages[(rank - 1) % coverImages.count]
                        )
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
        }
    }
}

struct NotificationSection: View {
    
    var SectionName: String = ""
    var SectionColor: Color = Color.red
    
    var body: some View {
        VStack (spacing: 20) {
            HStack(alignment: .center)
            {
                HStack(alignment: .center, spacing: 8) {
                    ZStack {  }
                        .frame(width: 44, height: 44)
                        .background(SectionColor)
                        .cornerRadius(50)
                    
                    Text(SectionName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                Spacer()
                Image("right")
                    .frame(width: 12, height: 22)
            }
            .padding(0)
            
            NotificationCard(Title: "Coming Soon", Subtext: "Play the trailer", Date: "Tomorrow")
            
            NotificationCard(Title: "Coming Soon", Subtext: "Play the trailer", Date: "Tomorrow")
        }
        .frame(width: 377, alignment: .center)
        .padding(.top, 24)
    }
}

struct DownloadsSection: View {
    
    var SectionName: String = ""
    var SectionColor: Color = Color.red
    
    var body: some View {
        VStack (spacing: 20) {
            HStack(alignment: .center)
            {
                HStack(alignment: .center, spacing: 8) {
                    ZStack {  }
                        .frame(width: 44, height: 44)
                        .background(SectionColor)
                        .cornerRadius(50)
                    
                    Text(SectionName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                Spacer()
                Image("right")
                    .frame(width: 12, height: 22)
            }
            .padding(0)
        }
        .frame(width: 377, alignment: .center)
        .padding(.top, 24)
    }
}

struct ProfileCardSection: View {
    var title: String
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<5, id: \.self) { _ in
                        MediumCard(imageName: "witcher")
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 8)
                .padding(.trailing, 8)
            }
        }
    }
}

#Preview("SmallCardSection") {
    SmallCardSection()
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

#Preview("MediumCardSection") {
    MediumCardSection(title: "Top Searches", cover: "one-1")
        .environmentObject(AppRouter())
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

#Preview("TopTenCardSection") {
    TopTenCardSection(title: "Top 10 Movies in India Today")
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

