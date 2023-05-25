import SwiftUI

/// View with a navigation bar, a title and a toolbar item.
struct NavigationBarForHistoryOfOperationView<Content: View>: View {
    /// The title displayed in the navigation bar.
    let title: String

    /// The title displayed in the toolbar item.
    let toolBarItemTitle: String

    /// The content to be displayed within the view.
    let content: () -> Content

    var body: some View {
        NavigationStack {
            content()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Text(toolBarItemTitle)
                        .font(.system(size: fontBodySize))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
        }
    }

    // MARK: Private interface

    private let fontBodySize: CGFloat = 20
}

struct NavigationBarForHistoryOfOperationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarForHistoryOfOperationView(title: "History of operations", toolBarItemTitle: "Add") {
            VStack {
                Text("Any other view can be placed here")
            }
        }
    }
}
