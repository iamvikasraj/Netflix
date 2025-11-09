import SwiftUI

struct Header: View {
    var pageName: String = ""
    var r1: String = ""
    var r2: String = ""
    var r3: String = ""
    var filters: [String]? = nil
    var useGlassEffectForFilters: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            // Main header row
            HStack {
                Text(pageName)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack(spacing: 22) {
                    ForEach([r1, r2, r3], id: \.self) { imageName in
                        Image(imageName)
                            .frame(width: 22, height: 22)
                    }
                }
            }
            .padding(.horizontal, 10)
            
            // Optional filter buttons
            if let filters = filters, !filters.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 8) {
                        ForEach(filters, id: \.self) { filter in
                            FilterButton(
                                title: filter,
                                isBold: filter == filters.first,
                                useGlassEffect: useGlassEffectForFilters
                            )
                        }
                    }
                }
                .padding(.leading, 10)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.black)
    }
}

struct FilterButton: View {
    let title: String
    var isBold: Bool = false
    var useGlassEffect: Bool = false
    var action: (() -> Void)? = nil
    
    var body: some View {
        Group {
            if useGlassEffect {
                Button(action: { action?() }) {
                    HStack(alignment: .center, spacing: 10) {
                        Text(title)
                            .font(.system(size: 14, weight: isBold ? .bold : .semibold))
                            .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 15)
                    .padding(.vertical, 8)
                    .frame(height: 34, alignment: .center)
                    .glassEffect(in: .rect(cornerRadius: 16.0))
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                Button(action: { action?() }) {
                    Text(title)
                        .font(.system(size: 14, weight: isBold ? .bold : .semibold))
                        .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
                        .padding(.horizontal, 16)
                        .frame(height: 34)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview("Header") {
    Header(pageName: "For Rocky", r1: "share", r2: "download", r3: "search")
        .preferredColorScheme(.dark)
        .background(Color.black)
        .padding()
}

#Preview("Header with Filters") {
    Header(
        pageName: "For Rocky",
        r1: "share",
        r2: "download",
        r3: "search",
        filters: ["TV Shows", "Movies", "Categories"]
    )
    .preferredColorScheme(.dark)
    .background(Color.black)
    .padding()
}

#Preview("FilterButton - Simple") {
    HStack {
        FilterButton(title: "TV Shows")
        FilterButton(title: "Movies")
        FilterButton(title: "Categories")
    }
    .preferredColorScheme(.dark)
    .background(Color.black)
    .padding()
}

#Preview("FilterButton - Glass Effect") {
    HStack {
        FilterButton(title: "🍿 Coming Soon", isBold: true, useGlassEffect: true)
        FilterButton(title: "🔥 Everyone's Watching", useGlassEffect: true)
    }
    .preferredColorScheme(.dark)
    .background(Color.black)
    .padding()
}

