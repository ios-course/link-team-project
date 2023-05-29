import SwiftUI

/// This button style is transparent button with blue text and bold font.
struct NavigationBarItemBlue: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: fontBodySize))
            .fontWeight(.bold)
            .foregroundColor(.blue)
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}
