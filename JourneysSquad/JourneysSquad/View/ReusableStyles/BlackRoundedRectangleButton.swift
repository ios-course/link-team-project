import SwiftUI

/// Create a button as a black rectangle with rounded corners and white text inside.
struct BlackRoundedRectangleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: fontBodySize))
            .fontWeight(.bold)
            .frame(
                width: buttonWidth,
                height: buttonHeight
            )
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(buttonCornerRadius)
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
    private let buttonWidth: CGFloat = 150
    private let buttonHeight: CGFloat = 40
    private let buttonCornerRadius: CGFloat = 15
}

struct BlackRoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Save") {}
            .buttonStyle(BlackRoundedRectangleButton())
    }
}
