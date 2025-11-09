import SwiftUI
import RiveRuntime

struct HomeView: View {
    @State var isMainshowtapped: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack(spacing:12) {
                    Header(pageName: "For Rocky", r1: "share", r2: "download", r3: "search")
                    HeaderLabel()
                        .padding(.bottom, 8)
               }.zIndex(1)
                
                
                // Main content
                ScrollView() {
                    VStack(spacing: 16) {
                        Spacer().frame(height: 160)
                        VStack {
                            Spacer()
                            HStack {
                                let btn1: String = "Play"
                                let btn2: String = "My List"
                                
                                // Play Button
                                Button(action: {
                                    // Add haptic feedback
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                    impactFeedback.impactOccurred()
                                    
                                    // Add your play action here
                                    print("Play button tapped")
                                }) {
                                    HStack(alignment: .center, spacing: 10) {
                                        Image("played")
                                            .frame(width: 22, height: 22)
                                        
                                        Text(btn1)
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 0)
                                    .padding(.vertical, 9)
                                    .frame(width: min(geometry.size.width * 0.4, 151), height: 42, alignment: .center)
                                    .glassEffect()
                                    .cornerRadius(4)
                                }
                                .buttonStyle(PlainButtonStyle()) // Removes default button styling
                                
                                // My List Button
                                Button(action: {
                                    // Add haptic feedback
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                    impactFeedback.impactOccurred()
                                    
                                    // Add your my list action here
                                    print("My List button tapped")
                                }) {
                                    HStack(alignment: .center, spacing: 10) {
                                        Image("mylist")
                                            .frame(width: 22, height: 22)
                                        
                                        Text(btn2)
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 0)
                                    .padding(.vertical, 9)
                                    .frame(width: min(geometry.size.width * 0.4, 151), height: 42, alignment: .center)
                                    .glassEffect()
                                }
                                .buttonStyle(PlainButtonStyle()) // Removes default button styling
                            }
                            .padding(.bottom, 16)
                            .padding(.top, 16)
                        }
                        .frame(width: 345, height: 486)
                        .background(
                            ZStack {
                                // Background image
                                Image("hero") // Replace with your image name
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 345, height: 486)
                            }
                        )
                        .clipped()
                        .cornerRadius(16)
                        
                        // Mobile Games section
                        SmallCardSection()
                        
                        MediumCardSection(title: "Top Searches", cover: "one-1")
                        
                        MediumCardSection(title: "Emmy - Winning US TV Shows", cover: "one-2")
                        
                        MediumCardSection(title: "Movies & TV Shows Dubbed in Tamil", cover: "one-3")
                        
                        TopTenCardSection(title: "Top 10 Movies in India Today")
                        
                        MediumCardSection(title: "We Think You'll Love These", cover: "one-4")
                        
                        MediumCardSection(title: "Continue Watching for Rocky", cover: "one-4")
                        
                        TopTenCardSection(title: "Top 10 TV Shows in India Today")
                        
                        MediumCardSection(title: "Activating Beast Mode", cover: "one-4")
                        
                        MediumCardSection(title: "New on Netflix", cover: "one-4")
                        
                        MediumCardSection(title: "Critcially Acclaimed Movies", cover: "one-4")
                        
                        MediumCardSection(title: "Get it on the Action", cover: "one-4")
                        
                        MediumCardSection(title: "Exsiting US TV Shows", cover: "one-4")
                        
                        MediumCardSection(title: "Hollywood Movies", cover: "one-4")
                        
                        MediumCardSection(title: "Todays Top Pick for You", cover: "one-4")
                        
                        MediumCardSection(title: "Witty US TV Comedy Shows", cover: "one-4")
                        
                        MediumCardSection(title: "Your Next Watch", cover: "one-4")
                        
                        MediumCardSection(title: "Because you watch Minions & More", cover: "one-4")
                        
                        MediumCardSection(title: "Emotional Movies", cover: "one-4")
                        
                        MediumCardSection(title: "Epic Worlds", cover: "one-4")
                        
                        MediumCardSection(title: "Comedies", cover: "one-4")
                        
                        MediumCardSection(title: "Children & Family Movies", cover: "one-4")
                        
                        MediumCardSection(title: "Crowd Pleasers", cover: "one-4")
                        
                        MediumCardSection(title: "Young Adult Movies & Shows", cover: "one-4")
                        
                        // Add extra spacing at the bottom to account for the nav bar
                        
                    }
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

