import SwiftUI

/// View with a navigation bar, a title and a toolbar item.
struct NavigationBarForHistoryOfOperationView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Any other view can be placed here")
            }
            .navigationTitle("History of operations")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Text("Add")
                    .font(.system(size: fontBodySize, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
        }
    }

    // MARK: Private interface

    private let fontBodySize: CGFloat = 20
}

// MARK: Internal Interface

struct NavigationBarForHistoryOfOperationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarForHistoryOfOperationView()
    }
}
