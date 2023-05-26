import SwiftUI

/// Create a button as a black rectangle with rounded corners and white text inside.
struct BlackRoundedRectangleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: BlackRoundedRectangleButton.fontBodySize,
                          weight: .bold))
            .frame(width: BlackRoundedRectangleButton.buttonWidth,
                   height: BlackRoundedRectangleButton.buttonHeight)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(BlackRoundedRectangleButton.buttonCornerRadius)
    }

    // MARK: - Private interface

    private static let fontBodySize: CGFloat = 20
    private static let buttonWidth: CGFloat = 150
    private static let buttonHeight: CGFloat = 40
    private static let buttonCornerRadius: CGFloat = 15
}

struct BlackRoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Save") {}
            .buttonStyle(BlackRoundedRectangleButton())
    }
}
