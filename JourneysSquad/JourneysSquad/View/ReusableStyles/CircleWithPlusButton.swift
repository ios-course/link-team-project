import SwiftUI

/// Create a button as a circle with a plus in the center.
struct CircleWithPlusButton: ButtonStyle {
    func makeBody(configuration _: Configuration) -> some View {
        Image(systemName: .AppIconName.circleWithPlusInCenter)
            .resizable()
    }
}

struct CircleWithPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("") {}
                .buttonStyle(CircleWithPlusButton())
                .frame(width: 100, height: 100)

            Button("") {}
                .buttonStyle(CircleWithPlusButton())
                .frame(width: 10, height: 10)
        }
    }
}
