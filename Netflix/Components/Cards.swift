import SwiftUI

struct SmallCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                Image("game_0")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110, height: 110)
                    .clipped()
            }
            .frame(width: 110, height: 110)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
            .drawingGroup() // Rasterize for better scroll performance
    
            VStack(alignment: .leading, spacing: 2) {
                Text("Street Fighter IV CE")
                    .font(.system(size: 12, weight: .bold))
                  .foregroundColor(.white)
                  .frame(width: 110, alignment: .topLeading)
                
                Text("Action")
                .font(.system(size: 12, weight: .regular))
                  .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

struct MediumCard: View {
    var imageName: String
    var contentId: String? = nil
    var contentType: ContentType? = nil
    var onTap: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110, height: 159)
                    .clipped()
            }
            .frame(width: 110, height: 159)
            .background(.gray)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0)
                    .stroke(Color(red: 0.16, green: 0.16, blue: 0.16).opacity(0.2), lineWidth: 1)
            )
            .drawingGroup() // Rasterize for better scroll performance
        }
        .onTapGesture {
            onTap?()
        }
    }
}

struct BigCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack {
                // Game content here
            }
            .frame(width: 163, height: 333)
            .background(.gray)
            .cornerRadius(4)
            
        }
    }
}

struct TopTenCard: View {
    var rank: Int
    var imageName: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -28) {
            Text("\(rank)")
                .font(Font.custom("Inter", size: 132).weight(.heavy))
                .kerning(-3)
                .frame(height: 100)
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 6) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110, height: 159)
                    .clipped()
            }
            .frame(width: 110, height: 159)
            .background(.gray)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0)
                    .stroke(Color(red: 0.16, green: 0.16, blue: 0.16).opacity(0.2), lineWidth: 1)
            )
            .drawingGroup()
        }
    }
}

struct NewCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ZStack {
                
            }
            .frame(maxWidth: .infinity, minHeight: 211, maxHeight: 211)
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
        }
        .padding(0)
        .frame(width: 361, height: 332, alignment: .top)
        .cornerRadius(12)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.25)
            .stroke(Color(red: 0.47, green: 0.39, blue: 0.38).opacity(0.67), lineWidth: 0.5)
        )
    }
}

struct NotificationCard: View {
    
    var Title : String = ""
    var Subtext : String = ""
    var Date : String = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            ZStack { }
                .frame(width: 8, height: 8)
                .background(Color(red: 1, green: 0, blue: 0))
                .cornerRadius(30)
            
            ZStack { }
                .frame(width: 124, height: 70)
                .background(Color(red: 0.22, green: 0.09, blue: 0))
                .cornerRadius(4)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(Title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Text(Subtext)
                    .font(.system(size: 14, weight: .regular))
                    .kerning(0.48)
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Text(Date)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding(0)
        .frame(width: 370, alignment: .leading)
    }
}

#Preview("SmallCard") {
    SmallCard()
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

#Preview("MediumCard") {
    MediumCard(imageName: "witcher")
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

#Preview("TopTenCard") {
    TopTenCard(rank: 1, imageName: "witcher")
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

#Preview("NewCard") {
    NewCard()
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

