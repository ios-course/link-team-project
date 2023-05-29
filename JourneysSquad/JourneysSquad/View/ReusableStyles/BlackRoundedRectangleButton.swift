import SwiftUI

/// A type that applies standard interaction behaviour and a custom appearance to all buttons within a view hierarchy.
 /// The button will have a rectangular black shape with rounded corners.
 /// The button will have a label with the white center-aligned text.
 ///
 /// To configure the current button style for a view hierarchy, use the `buttonStyle(_:)` modifier.
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
        VStack {
            Button("") {}
              .buttonStyle(BlackRoundedRectangleButton())
           Button("Save") {}
              .buttonStyle(BlackRoundedRectangleButton())
            Button("And here's a button with a quite long fancy text") {}
              .buttonStyle(BlackRoundedRectangleButton())
        }
    }
}
