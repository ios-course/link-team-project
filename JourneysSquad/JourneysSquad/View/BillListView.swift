import SwiftUI
/// Displays the list of bills.
struct BillListView: View {
    // MARK: - Internal interface

    /// Dummy view model that provides data for the view.
    let billListViewModel = DummyBillListViewModel()

    var body: some View {
        List(billListViewModel.listData) { sectionViewModel in
            BillSectionView(sectionViewModel: sectionViewModel)
        }
        .listStyle(.grouped)
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
