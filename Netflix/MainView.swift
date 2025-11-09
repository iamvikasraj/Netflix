import SwiftUI

struct MainView: View {
    @StateObject private var router = AppRouter()
    
    var body: some View {
        TabView(selection: Binding(
            get: { router.selectedTab },
            set: { router.selectTab($0) }
        )) {
            // Home Tab
            NavigationStack(path: $router.navigationPath) {
                HomeView()
                    .navigationDestination(for: Route.self) { route in
                        RouteView(route: route)
                    }
                    .background(Color.black)
            }
            .tabItem {
                Image("homeline")
                    .renderingMode(.template)
                Text("Home")
            }
            .tag(AppRouter.Tab.home)
            
            // New & Hot Tab
            NavigationStack(path: $router.navigationPath) {
                HotView()
                    .navigationDestination(for: Route.self) { route in
                        RouteView(route: route)
                    }
                    .background(Color.black)
            }
            .tabItem {
                Image("hot")
                    .renderingMode(.template)
                Text("New & Hot")
            }
            .tag(AppRouter.Tab.newHot)
            
            // My Netflix Tab
            NavigationStack(path: $router.navigationPath) {
                ProfileView()
                    .navigationDestination(for: Route.self) { route in
                        RouteView(route: route)
                    }
                    .background(Color.black)
            }
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("My Netflix")
            }
            .tag(AppRouter.Tab.myNetflix)
        }
        .onAppear {
            // Configure tab bar appearance for iOS 26 liquid glass style
            let tabAppearance = UITabBarAppearance()
            tabAppearance.configureWithTransparentBackground()
            tabAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            
            // Configure selected and unselected item colors
            tabAppearance.stackedLayoutAppearance.selected.iconColor = .red
            tabAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
            tabAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
            tabAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
            
            // Apply liquid glass blur effect
            UITabBar.appearance().standardAppearance = tabAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabAppearance
        }
        .background(Color.black)
        .environmentObject(router)
        .sheet(item: Binding(
            get: { router.presentedSheet },
            set: { router.presentedSheet = $0 }
        )) { route in
            Group {
                // Content detail views get large detent bottom sheet
                if case .contentDetail = route {
                    RouteView(route: route)
                        .presentationDetents([.large])
                        .presentationDragIndicator(.hidden)
                        .presentationBackground(.black)
                } else {
                    // Other sheets get standard presentation
                    NavigationStack {
                        RouteView(route: route)
                            .background(Color.black)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Done") {
                                        router.dismissSheet()
                                    }
                                    .foregroundColor(.white)
                                }
                            }
                    }
                }
            }
        }
        .fullScreenCover(item: Binding(
            get: { router.presentedFullScreenCover },
            set: { router.presentedFullScreenCover = $0 }
        )) { route in
            RouteView(route: route)
                .background(Color.black)
        }
    }
}


#Preview {
    MainView()
}

