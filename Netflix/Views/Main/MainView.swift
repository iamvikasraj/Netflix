import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            HotView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("New & Hot")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("My Netflix")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.stackedLayoutAppearance.selected.iconColor = .red
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
            appearance.stackedLayoutAppearance.normal.iconColor = .gray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}


#Preview {
    MainView()
}

