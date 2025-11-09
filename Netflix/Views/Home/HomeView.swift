import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: AppRouter
    
    private let sections: [HomeSection] = HomeSection.sampleSections
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                HeroCard(
                    imageName: "hero",
                    contentId: "hero-1",
                    onPlay: { print("Play tapped") },
                    onMyList: { print("My List tapped") }
                )
                
                ForEach(sections) { section in
                    HomeSectionView(section: section)
                }
                
                Spacer().frame(height: 48)
            }
            .scrollIndicators(.hidden)
            .background(.black)
        }
        .background(.black)
        .navigationTitle("For Rocky")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(AppRouter())
    .preferredColorScheme(.dark)
    .background(Color.black)
}
