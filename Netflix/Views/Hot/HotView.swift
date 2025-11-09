import SwiftUI

struct HotView: View {
    var body: some View {
        GeometryReader { geometry in
            
            HotHeader()
            .zIndex(1)
            
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 16) {
                     
                        NewCard()
                        
                        NewCard()
                        
                        NewCard()
                        
                        // Mobile Games section
                        
                        
                        // Add extra spacing at the bottom to account for the nav bar
                        Spacer()
                            .frame(height: 90)
                    }
                    .padding(.top, 160)
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

struct HotHeader: View {
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                // Header
                HStack {
                    Text("Hot & New")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 22) {
                        ForEach(["share", "download", "search"], id: \.self) { imageName in
                            Image(imageName)
                                .frame(width: 22, height: 22)
                        }
                    }
                }
                .padding(.horizontal, 10)
                
                // Filter Buttons
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 8) {
                        HStack(alignment: .center, spacing: 10) {
                            Text("🍿 Coming Soon")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 15)
                        .padding(.vertical, 8)
                        .frame(height: 34, alignment: .center)
                        .glassEffect(in: .rect(cornerRadius: 16.0))
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("🔥 Everyone's Watching")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 15)
                        .padding(.vertical, 8)
                        .frame(height: 34, alignment: .center)
                        .glassEffect(in: .rect(cornerRadius: 16.0))
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("Categories")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 15)
                        .padding(.vertical, 8)
                        .frame(height: 34, alignment: .center)
                        .glassEffect(in: .rect(cornerRadius: 16.0))
                    }
                    
                    Spacer()
                }
                .padding(.leading, 10)
            }
            .padding(.bottom, 8)
        }
        .frame(height: 80)
        .background(Color.black)
        .zIndex(1)
    }
}

