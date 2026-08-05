import SwiftUI

extension View {
    /// The scroll-reactive Netflix header backdrop: fully transparent at the top
    /// (so any ambient tint or hero art shows through) and blurring into a
    /// translucent dark material as `progress` moves 0 → 1 on scroll. Shared by
    /// every tab's header so they behave identically.
    func scrollHeaderBackground(progress: Double) -> some View {
        background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .environment(\.colorScheme, .dark)
                .opacity(progress)
                .ignoresSafeArea(edges: .top)
        }
    }
}

struct Header: View {
    
    var pageName : String = ""
    var r1 : String = ""
    var r2 : String = ""
    var r3 : String = ""
    // Background style for the header bar. Defaults to solid black; callers can
    // pass a material (or .clear to let a parent supply the background).
    var background: AnyShapeStyle = AnyShapeStyle(Color.black)

    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                // Header
                HStack {
                    Text(pageName)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 22) {
                        ForEach([r1, r2, r3], id: \.self) { imageName in
                            if imageName == "download" {
                                Button(action: {
                                    // TODO: Handle header download action
                                    print("Header download tapped")
                                }) {
                                    Image(imageName)
                                        .frame(width: 22, height: 22)
                                }
                                .buttonStyle(.plain)
                            } else if !imageName.isEmpty {
                                Image(imageName)
                                    .frame(width: 22, height: 22)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 8)
        }
        .background(background)
    }
}

struct HeaderLabel: View {
    // Fired when the "Categories" chip is tapped. The parent owns the expanded
    // menu so it can cover the whole screen (tab bar included).
    var onCategories: () -> Void = {}
    // Whether that menu is currently open, so the chevron can flip.
    var categoriesOpen: Bool = false

    var body: some View {
        HStack {
            // TV Shows / Movies are display-only chips for now (no-op tap).
            FilterButton(title: "TV Shows")
            FilterButton(title: "Movies")
            FilterButton(
                title: "Categories",
                chevron: categoriesOpen ? "chevron.up" : "chevron.down"
            ) {
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
                onCategories()
            }
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

struct FilterButton: View {
    let title: String
    // Optional trailing SF Symbol (e.g. "chevron.down" on the Categories chip).
    var chevron: String? = nil
    // Each chip owns its own tap via a real Button rather than a parent gesture.
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                if let chevron {
                    Image(systemName: chevron)
                        .font(.system(size: 10, weight: .semibold))
                }
            }
            .foregroundColor(Color(red: 0.83, green: 0.82, blue: 0.82))
            .padding(.horizontal, 16)
            .frame(height: 34)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.47, green: 0.39, blue: 0.38), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

