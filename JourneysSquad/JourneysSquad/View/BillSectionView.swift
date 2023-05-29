import SwiftUI

struct BillSectionView: View {
    let sectionViewModel: DummySectionViewModel

    var body: some View {
        Section(header: Text(sectionViewModel.sectionHeader).font(.system(size: fontBodySize))) {
            ForEach(sectionViewModel.rows) { row in
                BillRowView(viewModel: row)
            }
        }
        .compositingGroup()
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}

struct BillSectionView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            DummySectionViewModel.dummyBillSectionViewModelInstance
        }
    }
}
