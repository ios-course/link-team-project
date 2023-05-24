import SwiftUI

/// The black circle view with a white plus in the center.
struct CircleWithPlusView: View {
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .frame(width: frameWidthAndHeight, height: frameWidthAndHeight)
            .padding(7)
            .background(Color.black)
            .foregroundColor(.white)
            .clipShape(Circle())
    }

    // MARK: - Private interface

    private let frameWidthAndHeight: CGFloat = 25
}

struct CircleWithPlusView_Previews: PreviewProvider {
    static var previews: some View {
        CircleWithPlusView()
    }
}
