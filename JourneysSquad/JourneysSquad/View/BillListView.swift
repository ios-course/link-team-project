import SwiftUI
/// A view displaying the list of bills.
struct BillListView: View {
    var body: some View {
        List {
            ForEach(BillListDummyData.listData, id: \.headerText) { section in
                Section(header: Text(section.headerText).font(.system(size: 20))) {
                    ForEach(section.rows) { row in
                        BillRowView(viewModel: row)
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
