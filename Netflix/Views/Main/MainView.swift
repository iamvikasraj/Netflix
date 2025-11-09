import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home
        case newHot
        case myNetflix
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Main content area
            ZStack {
                switch selectedTab {
                case .home:
                    HomeView()
                case .newHot:
                    HotView()
                case .myNetflix:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Navigation bar
            VStack(alignment: .leading, spacing: 0) {
                HStack() {
                    // First nav item - Home
                    VStack(spacing: 4) {
                        Image(selectedTab == .home ? "home" : "homeline" )
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("Home")
                            .font(.system(size: 10))
                            .foregroundColor(selectedTab == .home ? .white : .gray)
                    }
                    .onTapGesture {
                        selectedTab = .home
                    }
                    
                    Spacer()
                    
                    // Second nav item - New & Hot
                    VStack(spacing: 4) {
                        Image(selectedTab == .newHot ? "hotfill" : "hot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("New & Hot")
                            .font(.system(size: 10))
                            .foregroundColor(selectedTab == .newHot ? .white : .gray)
                    }
                    .onTapGesture {
                        selectedTab = .newHot
                    }
                    
                    Spacer()
                    
                    // Third nav item - My Netflix
                    VStack(spacing: 4) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 24, height: 24)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85)).opacity(0.1)
                        
                        Text("My Netflix")
                            .font(.system(size: 10))
                            .foregroundColor(selectedTab == .myNetflix ? .white : .gray)
                    }
                    .onTapGesture {
                        selectedTab = .myNetflix
                    }
                }
                .padding(.top, 2)
                .padding(.horizontal, 38)
            }
            .frame(height: 48)
            .background(Color.black).opacity(0.9)
        }
    }
}


#Preview {
    MainView()
}

