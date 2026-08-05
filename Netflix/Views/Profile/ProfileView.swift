import SwiftUI

struct ProfileView: View {
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            // Collapse progress: 0 = fully expanded, 1 = fully collapsed
            let collapse = min(max(scrollOffset / 120, 0), 1)
            ZStack(alignment: .top) {
                Header(pageName: "My Netflix", r1: "share", r2: "search", r3: "menu", background: AnyShapeStyle(.clear))
                    .scrollHeaderBackground(progress: collapse)
                    .zIndex(1)
                
                // Main content
                ScrollView {
                    VStack(spacing: 16) {
                        VStack(alignment: .center, spacing: 2) {
                            ZStack {
                                
                            }
                            .frame(width: 70, height: 70)
                            .background(.white)
                            .cornerRadius(6)
                            
                            HStack(alignment: .center, spacing: 7) {
                                Text("Rocky")
                                    .font(.system(size: 24, weight: .semibold))
                                  .foregroundColor(.white)
                                
                                Image("down")
                                .frame(width: 10.5, height: 5.5)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(0)
                        .frame(width: 89.5, alignment: .top)
                        
                        
                        ProfileCardSection(title: "My List", category: .popular, showsSeeAll: true)

                        ProfileCardSection(title: "Trailers you have watched", category: .trending)

                        ProfileCardSection(title: "Continue Watching", category: .nowPlaying)

                        ProfileCardSection(title: "Recently Watched", category: .topRated)

                        ProfileCardSection(title: "Go behind the scenes", category: .upcoming)

                        Spacer()
                    }
                    .padding(.top, 120)
                    .padding(.vertical, 16)
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
    ProfileView()
}

