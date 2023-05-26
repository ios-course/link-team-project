import SwiftUI
/// A view displaying the list of bills.
struct BillListView: View {
    // MARK: - Internal interface

    var body: some View {
        List {
            ForEach(BillListDummyData.listData, id: \.headerText) { section in
                Section(header: Text(section.headerText).font(.system(size: fontBodySize))) {
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
