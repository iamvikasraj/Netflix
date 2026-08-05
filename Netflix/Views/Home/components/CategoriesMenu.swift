import SwiftUI

/// Full-screen category browser that expands when the "Categories" chip is
/// tapped. Ported from the Morsel app's menu-expand overlay: a blurred backdrop
/// that lets the home content show through dimmed, a left-aligned list of
/// categories, and a circular close button pinned to the bottom centre.
///
/// Presented as an animated overlay (not a system sheet) so it covers the whole
/// screen — including the tab bar — and so the caller controls the spring.
struct CategoriesMenu: View {
    let categories: [String]
    let onSelect: (String) -> Void
    let onClose: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            // Blurred backdrop — the home screen shows through, dimmed. Tapping
            // anywhere off a row dismisses the menu.
            Rectangle()
                .fill(.ultraThinMaterial)
                .environment(\.colorScheme, .dark)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture(perform: onClose)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    ForEach(categories, id: \.self) { category in
                        Button { onSelect(category) } label: {
                            Text(category)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundStyle(Color(red: 0.72, green: 0.72, blue: 0.74))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)
                .padding(.bottom, 160)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            // Bottom scrim: a dark linear fade so the lower rows dissolve into
            // black while staying faintly visible behind the close button.
            LinearGradient(
                colors: [.clear, .black.opacity(0.85), .black],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 240)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .allowsHitTesting(false)

            // Circular close button, pinned bottom-centre. Mirrors the Morsel
            // MenuCloseButton, styled white to match the Netflix reference.
            Button(action: onClose) {
                Image(systemName: "xmark")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.black)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(.white))
                    .shadow(color: .black.opacity(0.28), radius: 12, y: 5)
            }
            .buttonStyle(.plain)
            .padding(.bottom, 50)
        }
    }
}

extension CategoriesMenu {
    /// The category labels shown in the expanded menu, mirroring the reference
    /// (My List / languages / studios) plus the app's genres.
    static let defaultCategories: [String] = [
        "My List",
        "Available for Download",
        "Book Adaptations",
        "Yash Raj Films",
        "Moods",
        "Astrology",
        "WWE",
        "Hindi",
        "Tamil",
        "Telugu",
        "Malayalam",
        "English",
        "Action",
        "Comedy",
        "Dramas",
        "Sci-Fi & Fantasy",
        "Thrillers",
        "Romance",
        "Documentaries",
        "Children & Family",
        "Horror",
        "Anime",
        "Reality TV",
        "Stand-Up Comedy"
    ]
}

#Preview {
    ZStack {
        Color.black
        CategoriesMenu(
            categories: CategoriesMenu.defaultCategories,
            onSelect: { _ in },
            onClose: { }
        )
    }
}
