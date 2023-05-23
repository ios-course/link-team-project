import SwiftUI

/// A view displaying information of the one bill.
struct BillRowView: View {
    /// The view model to provide data to the view.
    @ObservedObject var viewModel: BillRowViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.dummyDescription)
                    .lineLimit(1)
                    .font(.system(size: bodySize))

                Text(viewModel.formattedParticipants)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: noteSize))
            }
            Spacer()

            Text(viewModel.dummySumOfBill)
                .font(.system(size: bodySize))
                .lineLimit(1)
        }
        .padding()
    }
    /// Font "Note" used as required [App style guidlines]
    /// (https://github.com/ios-course/link-team-project/wiki/App-style-guidelines)
    private let noteSize: CGFloat = 14
    /// Font "Body" used as required [App style guidlines]
    /// (https://github.com/ios-course/link-team-project/wiki/App-style-guidelines)
    private let bodySize: CGFloat = 20
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        let dummyBill = BillRowViewModel()
        BillRowView(viewModel: dummyBill)
    }
}
