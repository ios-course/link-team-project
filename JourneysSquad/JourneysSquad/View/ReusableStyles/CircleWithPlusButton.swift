import SwiftUI

/// Create a button as a circle with a plus in the center.
struct CircleWithPlusButton: ButtonStyle {
    func makeBody(configuration _: Configuration) -> some View {
        Image(systemName: .AppIconName.plus)
            .resizable()
            .frame(width: frameWidth,
                   height: frameHeight)
    }

    /// Creates a circle button. The circle is inscribed in a rectangle
    /// frame with the specified width and height.
    ///
    /// By default the frame width and height equal to 35 points.
    ///
    /// - Parameters:
    ///  - width: The frame width in which the button is inscribed.
    ///  - height: The frame height in which the button is inscribed.
    init(width: CGFloat = 35,
         height: CGFloat = 35) {
        frameWidth = width
        frameHeight = height
    }

    // MARK: - Private interface

    private let frameWidth: CGFloat
    private let frameHeight: CGFloat
}

struct CircleWithPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("") {}
            .buttonStyle(CircleWithPlusButton())
    }
}
