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
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<5) { _ in
                        SmallCard()
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

struct MediumCardSection: View {
    var title: String
    var cover: String
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
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    MediumCard(imageName: "witcher")
                    MediumCard(imageName: "you")
                    MediumCard(imageName: "dearchild")
                    MediumCard(imageName: "madness")
                    MediumCard(imageName: "bodyproblem")
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
}

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
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<9) { _ in
                        BigCard()
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

struct TopTenCardSection: View {
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
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(1...10, id: \.self)
                    {
                        rank in
                        TopTenCard(rank: rank)
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
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<5) { _ in
                        MediumCard(imageName: "witcher")
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 8)
                .padding(.trailing, 8)
            }
            .scrollIndicators(.hidden)
        }
    }
}

