import SwiftUI

/// View to see list of added bills split on sections and sorted by date.
/// Contain navigation bar with title and button now.
struct HistoryOfOperationsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                BillListView()
            }
            .navigationTitle(titleText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(labelText, destination: AddBillView())
            }
        }
    }

    // MARK: - Private interface

    private let titleText = "History of Operations"
    private let labelText = "Add"
}

struct HistoryOfOperationsView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryOfOperationsView()
    }
}
