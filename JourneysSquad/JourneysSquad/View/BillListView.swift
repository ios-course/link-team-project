import SwiftUI
/// Displays the list of bills.
struct BillListView: View {
    // MARK: - Internal interface
    /// Dummy view model that provides data for the view.
    let billListViewModel = DummyBillListViewModel()

    var body: some View {
        List {
            ForEach(billListViewModel.listData) { section in
                Section(header: Text(section.sectionHeader).font(.system(size: fontBodySize))) {
                    ForEach(section.rows) { row in
                        BillRowView(viewModel: row)
                    }
                }
            }
        }
        .listStyle(.grouped)
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
