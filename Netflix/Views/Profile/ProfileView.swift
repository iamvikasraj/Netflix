import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Header(pageName: "My Netflix", r1: "share", r2: "search", r3: "menu")
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
                        
                        
                        NotificationSection(SectionName: "Notifications", SectionColor: .red)
                        
                        DownloadsSection(SectionName: "Downloads", SectionColor: .purple)
                        
                        ProfileCardSection(title: "My section")
                        
                        Spacer()
                    }
                    .padding(.top, 120)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
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
    MainView()
}

