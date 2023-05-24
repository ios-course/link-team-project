import SwiftUI

/// A black rectangle button with rounded corners and white text inside.
struct RoundedRectangleView: View {
    /// The text inside the rectangle.
    @State var label: String

    var body: some View {
        Text(label)
            .font(.system(size: fontBodySize, weight: .bold, design: .rounded))
            .frame(width: buttonWidth, height: buttonHeight)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(buttonCornerRadius)
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
    private let buttonWidth: CGFloat = 150
    private let buttonHeight: CGFloat = 40
    private let buttonCornerRadius: CGFloat = 10
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView(label: "Hello")
    }
}
