import SwiftUI

/// Displays a list of bills grouped into sections by date.
struct BillListView: View {
    // MARK: - Internal interface

    /// Dummy view model that provides data for the view.
    let listViewModel = DummyBillListViewModel()

    var body: some View {
        List(listViewModel.billsGroupedIntoSectionsByDate) { section in
            BillSectionView(sectionViewModel: section)
        }
        .listStyle(.grouped)
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
