import SwiftUI

/// View with a navigation bar, a title and a toolbar item.
struct HistoryOfOperationView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Any other view can be placed here")
            }
            .navigationTitle("History of Operations")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Add") {}
                    .font(.system(size: fontBodySize))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
        }
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}

struct NavigationBarForHistoryOfOperationView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryOfOperationView()
    }
}
