import SwiftUI


struct HomeView: View {
    // Owned by MainView so the expanded category menu can cover the tab bar too.
    @Binding var showCategories: Bool
    @State var isMainshowtapped: Bool = false
    @State private var scrollOffset: CGFloat = 0
    // Ambient color extracted from the featured hero art. Starts black and
    // cross-fades in once the image has been sampled.
    @State private var ambientColor: Color = .black
    // Name of the hero asset the ambient tint is derived from.
    private let heroImageName = "dmc"

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // Collapse progress: 0 = fully expanded, 1 = fully collapsed
                let collapse = min(max(scrollOffset / 120, 0), 1)
                // Ambient backdrop fades out as the user scrolls past the hero.
                let ambientOpacity = 1 - min(max(scrollOffset / 300, 0), 1)

                // Ambient tint behind the hero: the featured art's color glows
                // from the top and dissolves into black further down the page.
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: ambientColor, location: 0.0),
                        .init(color: ambientColor, location: 0.35),
                        .init(color: ambientColor.opacity(0), location: 0.85)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 660)
                .frame(maxWidth: .infinity, alignment: .top)
                .opacity(ambientOpacity)
                .ignoresSafeArea()
                .allowsHitTesting(false)
                VStack(spacing: 12 - 4 * collapse) {
                    Header(pageName: "For Vikas Raj", r1: "share", r2: "download", r3: "search", background: AnyShapeStyle(.clear))
                    // Category chips are part of the header: as the user scrolls
                    // they scale down, move up and collapse their height so the
                    // whole (opaque) header shrinks and content passes underneath.
                    HeaderLabel(
                        onCategories: {
                            withAnimation(.spring(response: 0.38, dampingFraction: 0.9)) {
                                showCategories = true
                            }
                        },
                        categoriesOpen: showCategories
                    )
                        .padding(.bottom, 8)
                        .scaleEffect(1 - 0.35 * collapse, anchor: .top)
                        .opacity(1 - collapse)
                        .offset(y: -12 * collapse)
                        .frame(height: 42 * (1 - collapse), alignment: .top)
                        .clipped()
               }
               // Transparent at rest so the ambient tint flows behind the title;
               // blurs into a translucent dark material as the user scrolls up.
               .scrollHeaderBackground(progress: collapse)
               .zIndex(1)
                
                
                // Main content
                ScrollView() {
                    VStack(spacing: 16) {
                        Spacer().frame(height: 160)
                        ZStack {
                            // Background image - tappable to open MainCardView
                            Image("dmc")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 345, height: 486)
                                .clipped()
                                .cornerRadius(16)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    // Add haptic feedback
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                    impactFeedback.impactOccurred()
                                    
                                    // Show MainCardView
                                    isMainshowtapped = true
                                }
                            
                            // Buttons overlay - positioned at bottom
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
                                            Image("play")
                                                .frame(width: 22, height: 22)

                                            Text(btn1)
                                                .font(.system(size: 15, weight: .semibold))
                                                .foregroundColor(.black)
                                        }
                                        .padding(.horizontal, 0)
                                        .padding(.vertical, 9)
                                        .frame(width: min(geometry.size.width * 0.4, 151), height: 42, alignment: .center)
                                        .background(.white)
                                        .cornerRadius(4)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
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
                                        .background(Color(red: 0.25, green: 0.23, blue: 0.22))
                                        .cornerRadius(4)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .padding(.bottom, 16)
                                .padding(.top, 16)
                            }
                            .frame(width: 345, height: 486)
                        }
                        
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
                .onScrollGeometryChange(for: CGFloat.self) { proxy in
                    proxy.contentOffset.y
                } action: { _, newValue in
                    scrollOffset = max(0, newValue)
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea(.all)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .background(Color.black)
        }
        .task {
            await loadAmbientColor()
        }
        .sheet(isPresented: $isMainshowtapped) {
            MainCardView()
                .presentationDetents([.large])
                .presentationDragIndicator(.hidden)
                .presentationBackground(.black)
        }
    }

    /// Samples the hero artwork off the main thread and cross-fades the
    /// extracted ambient color into the backdrop.
    private func loadAmbientColor() async {
        let name = heroImageName
        let sampled: UIColor? = await Task.detached(priority: .utility) {
            UIImage(named: name)?.ambientColor
        }.value

        guard let sampled else { return }
        withAnimation(.easeInOut(duration: 0.7)) {
            ambientColor = Color(sampled)
        }
    }
}

#Preview {
    MainView()
}

