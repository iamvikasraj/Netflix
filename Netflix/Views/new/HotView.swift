import SwiftUI

struct HotView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                // Filter buttons
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 8) {
                        FilterButton(title: "🍿 Coming Soon", isBold: true, useGlassEffect: true)
                        FilterButton(title: "🔥 Everyone's Watching", useGlassEffect: true)
                        FilterButton(title: "Categories", useGlassEffect: true)
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 8)
                
                NewCard()
                NewCard()
                NewCard()
                
                // Add extra spacing at the bottom to account for the nav bar
                Spacer()
                    .frame(height: 90)
            }
            .padding(.vertical, 16)
            .scrollIndicators(.hidden)
            .background(.black)
        }
        .background(.black)
        .navigationTitle("Hot & New")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        HotView()
    }
    .environmentObject(AppRouter())
    .preferredColorScheme(.dark)
    .background(Color.black)
}

