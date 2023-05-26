import SwiftUI

/// Button style, which applies the style to the button label on the navigation bar.
struct NavigationBarBlueButtonStyle: ButtonStyle {
    /// Configures the appearance and behavior of the button.
    /// - Parameter configuration: The button's configuration.
    /// - Returns: A view representing the body of the button.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: fontBodySize))
            .fontWeight(.bold)
            .foregroundColor(.blue)
    }

    // // MARK: - Private interface
    private let fontBodySize: CGFloat = 20
}
