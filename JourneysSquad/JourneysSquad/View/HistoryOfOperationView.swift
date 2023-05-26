import SwiftUI

/// View with a navigation bar, a title and a toolbar item.
struct HistoryOfOperationsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("No operations found")
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(lableText) {}
                    .buttonStyle(NavigationBarBlueButtonStyle())
            }
        }
    }

    // MARK: - Private interface

    private let title = "History of Operations"
    private let lableText = "Add"
}

struct HistoryOfOperationsView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryOfOperationsView()
    }
}
