import SwiftUI

/// Create a button as a black circle with a white plus in the center.
struct BlackCircleWithPlusButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: String.AppIconName.plus)
            .resizable()
            .frame(width: frameWidthAndHeight,
                   height: frameWidthAndHeight)
            .padding(buttonPadding)
            .background(.black)
            .foregroundColor(.white)
            .clipShape(Circle())
    }

    // MARK: - Private interface

    private let frameWidthAndHeight: CGFloat = 20
    private let buttonPadding: CGFloat = 5
}

struct CircleWithPlusView_Previews: PreviewProvider {
    static var previews: some View {
        Button("") {}
            .buttonStyle(BlackCircleWithPlusButton())
    }
}
