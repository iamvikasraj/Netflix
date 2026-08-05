import SwiftUI

struct HotView: View {
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            // Collapse progress: 0 = fully expanded, 1 = fully collapsed
            let collapse = min(max(scrollOffset / 120, 0), 1)
            ZStack(alignment: .top) {
                HotHeader(backgroundProgress: collapse)
                    .zIndex(1)

                ScrollView {
                    VStack(spacing: 16) {

                        NewCard()

                        NewCard()

                        NewCard()

                        // Mobile Games section


                        // Add extra spacing at the bottom to account for the nav bar
                        Spacer()
                            .frame(height: 90)
                    }
                    .padding(.top, 160)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                }
                .onScrollGeometryChange(for: CGFloat.self) { proxy in
                    proxy.contentOffset.y
                } action: { _, newValue in
                    scrollOffset = max(0, newValue)
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea(.all)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(.black)
            }
        }
    }
}

#Preview {
    HotView()
}

struct HotHeader: View {
    var backgroundProgress: Double = 0

    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                // Header
                HStack {
                    Text("Hot & New")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 22) {
                        ForEach(["share", "download", "search"], id: \.self) { imageName in
                            if imageName == "download" {
                                Button(action: {
                                    // TODO: Handle hot header download action
                                    print("Hot header download tapped")
                                }) {
                                    Image(imageName)
                                        .frame(width: 22, height: 22)
                                }
                                .buttonStyle(.plain)
                            } else {
                                Image(imageName)
                                    .frame(width: 22, height: 22)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
                
                // Filter Buttons
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 8) {
                        HStack(alignment: .center, spacing: 10) {
                            Text("🍿 Coming Soon")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 15)
                        .padding(.vertical, 8)
                        .frame(height: 34, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.47, green: 0.39, blue: 0.38), lineWidth: 1)
                        )
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("🔥 Everyone's Watching")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 15)
                        .padding(.vertical, 8)
                        .frame(height: 34, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.47, green: 0.39, blue: 0.38), lineWidth: 1)
                        )
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("Categories")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 15)
                        .padding(.vertical, 8)
                        .frame(height: 34, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.47, green: 0.39, blue: 0.38), lineWidth: 1)
                        )
                    }
                    
                    Spacer()
                }
                .frame(height: 34)
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 8)
        }
        .scrollHeaderBackground(progress: backgroundProgress)
        .zIndex(1)
    }
}

