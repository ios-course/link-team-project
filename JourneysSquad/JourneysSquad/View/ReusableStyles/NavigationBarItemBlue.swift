import SwiftUI

/// A button style that applies a blue color, bold font, and a specified body font size to the button label.
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
