import SwiftUI

/// Create a button as a circle with a plus in the center.
struct CircleWithPlusButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: .AppIconName.plus)
            .resizable()
            .frame(width: frameWidth,
                   height: frameHeight)
    }

    // MARK: - Private interface

    private let frameWidth: CGFloat = 35
    private var frameHeight: CGFloat = 35
}

struct CircleWithPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("") {}
            .buttonStyle(CircleWithPlusButton())
    }
}
