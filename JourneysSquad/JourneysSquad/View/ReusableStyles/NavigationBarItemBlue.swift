import SwiftUI

/// A button style that applies a blue color, bold font, and a body font size
/// that specified on [App Style Guidelines](https://github.com/ios-course/link-team-project/wiki/App-Style-Guidelines)
/// to the button label.
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
