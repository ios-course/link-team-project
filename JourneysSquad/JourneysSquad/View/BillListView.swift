import SwiftUI

/// A view that shows a list of bills grouped by the date of creation.
struct BillListView: View {
    // MARK: - Internal interface

    /// Dummy view model that provides data for the view.
    let listViewModel = DummyBillListViewModel()

    var body: some View {
        List(listViewModel.billsGroupedIntoSectionsByDate) { section in
            BillSectionView(viewModel: section)
        }
        .listStyle(.grouped)
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
