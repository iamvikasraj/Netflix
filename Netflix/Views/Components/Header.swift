import SwiftUI

struct Header: View {
    
    var pageName : String = ""
    var r1 : String = ""
    var r2 : String = ""
    var r3 : String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                // Header
                HStack {
                    Text(pageName)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 22) {
                        ForEach([r1, r2, r3], id: \.self) { imageName in
                            Image(imageName)
                            .frame(width: 22, height: 22)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 8)
        }
        .background(Color.black)
    }
}

struct HeaderLabel: View {
    var body: some View {
        HStack {
            ForEach(["TV Shows", "Movies", "Categories"], id: \.self) { title in
                FilterButton(title: title)
            }
            .glassEffect()
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

struct FilterButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
            .padding(.horizontal, 16)
            .frame(height: 34)

    }
}

