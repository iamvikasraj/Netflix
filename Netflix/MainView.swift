import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    // Expanded category menu lives here so it can cover the tab bar as well.
    @State private var showCategories = false

    var body: some View {
        ZStack(alignment: .bottom) {
            // Content views
            Group {
                if selectedTab == 0 {
                    HomeView(showCategories: $showCategories)
                } else if selectedTab == 1 {
                    HotView()
                } else {
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .overlay {
            // Full-screen category browser, expanded from the Home "Categories"
            // chip using the same animated-overlay pattern as the Morsel menu.
            if showCategories {
                CategoriesMenu(
                    categories: CategoriesMenu.defaultCategories,
                    onSelect: { _ in
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
                            showCategories = false
                        }
                    },
                    onClose: {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
                            showCategories = false
                        }
                    }
                )
                .transition(.opacity)
                .zIndex(1)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(alignment: .center ,spacing: 0) {
            TabBarButton(
                icon: "home",
                activeIcon: "home-active",
                title: "Home",
                isSelected: selectedTab == 0
            ) {
                selectedTab = 0
            }
            
            TabBarButton(
                icon: "hot",
                activeIcon: "hot-active",
                title: "New & Hot",
                isSelected: selectedTab == 1
            ) {
                selectedTab = 1
            }
            
            ProfileTabButton(
                title: "My Netflix",
                isSelected: selectedTab == 2
            ) {
                selectedTab = 2
            }
        }
        .padding(.top, 16)
        .frame(height: 52)
        // Translucent dark blur so content faintly shows through, matching the
        // iOS Netflix tab bar (a subtle blur, not a solid slab).
        .background(.ultraThinMaterial)
        .environment(\.colorScheme, .dark)
    }
}

struct TabBarButton: View {
    let icon: String
    let activeIcon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(isSelected ? activeIcon : icon)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .font(.system(size: 10))
            }
            .foregroundColor(isSelected ? .white : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}

struct ProfileTabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                // User profile image with white overlay when selected
                ZStack {
                    // Profile image placeholder (you can replace with actual user image)
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 24, height: 24)
                        .overlay(
                            // You can add an actual user image here
                            // Image("userProfile")
                            //     .resizable()
                            //     .aspectRatio(contentMode: .fill)
                            //     .frame(width: 24, height: 24)
                            //     .clipShape(RoundedRectangle(cornerRadius: 4))
                            
                            // Placeholder icon for now
                            Image("dmc")
                                .resizable()
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        )
                    
                    // White overlay/border when selected
                    if isSelected {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: 24, height: 24)
                    }
                }
                
                Text(title)
                    .font(.system(size: 10))
            }
            .foregroundColor(isSelected ? .white : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}


#Preview {
    MainView()
}

