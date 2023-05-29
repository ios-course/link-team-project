import SwiftUI

struct BillSectionView: View {
    // MARK: - Internal interface

    /// Dummy view model that provides data for the view.
    let sectionViewModel: DummySectionViewModel

    var body: some View {
        Section {
            ForEach(sectionViewModel.rows) { row in
                BillRowView(viewModel: row)
            }
        } header: {
            Text(sectionViewModel.header)
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
                sectionViewModel: DummySectionViewModel(
                    header: "2023-05-23",
                    rows: [
                        DummyBillRowViewModel(
                            description: "Restaurant near center",
                            participants: "Ivan, Ulia, Egor",
                            sumOfBill: "50.12"
                        ),
                    ]
                )
            )
        }
    }
}
