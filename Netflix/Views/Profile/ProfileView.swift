import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                VStack(alignment: .center, spacing: 2) {
                    ZStack {
                        
                    }
                    .frame(width: 70, height: 70)
                    .background(.black)
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
                
                NotificationSection(SectionName: "Notifications", SectionColor: .red)
                
                DownloadsSection(SectionName: "Downloads", SectionColor: .purple)
                
                ProfileCardSection(title: "My section")
                
                Spacer()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .scrollIndicators(.hidden)
            .background(.black)
        }
        .background(.black)
        .navigationTitle("My Netflix")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
    .environmentObject(AppRouter())
    .preferredColorScheme(.dark)
    .background(Color.black)
}

