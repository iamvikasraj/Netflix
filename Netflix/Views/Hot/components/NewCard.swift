import SwiftUI

struct NewCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ZStack {}
                .frame(maxWidth: .infinity, minHeight: 211, maxHeight: 211)
                .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                .cornerRadius(12)
        }
        .padding(0)
        .frame(width: 361, height: 332, alignment: .top)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.25)
                .stroke(Color(red: 0.47, green: 0.39, blue: 0.38).opacity(0.67), lineWidth: 0.5)
        )
    }
}

#Preview {
    NewCard()
        .background(Color.black)
}
