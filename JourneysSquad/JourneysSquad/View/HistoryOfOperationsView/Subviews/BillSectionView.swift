import SwiftUI

struct BillSectionView: View {
    // MARK: - Internal interface

    /// Dummy view model that provides data for the view.
    let viewModel: DummySectionViewModel

    var body: some View {
        Section {
            ForEach(viewModel.rows) { row in
                BillRowView(viewModel: row)
            }
        } header: {
            Text(viewModel.header)
                .font(.system(size: fontBodySize))
        }
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}

struct BillSectionView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            BillSectionView(
                viewModel: DummySectionViewModel(
                    header: "2023-05-23",
                    rows: Bill.Dummy.bills.map { bill in
                        BillRowViewModel(bill: bill)
                    }
                )
            )
        }
    }
}
