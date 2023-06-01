import SwiftUI

/// A view displaying information of the one bill.
struct BillRowView: View {
    // MARK: - Internal interface

    /// The view model to provide data to the view.
    let viewModel: DummyBillRowViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.description)
                    .lineLimit(1)
                    .font(.system(size: bodySize))

                Text(viewModel.participants)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: noteSize))
            }
            Spacer()

            Text(viewModel.sumOfBill)
                .font(.system(size: bodySize))
                .lineLimit(1)
        }
        .padding()
    }

    // MARK: - Private interface

    /// Font "Note" used as required [App style guidlines]
    /// (https://github.com/ios-course/link-team-project/wiki/App-style-guidelines)
    private let noteSize: CGFloat = 14
    /// Font "Body" used as required [App style guidlines]
    /// (https://github.com/ios-course/link-team-project/wiki/App-style-guidelines)
    private let bodySize: CGFloat = 20
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        BillRowView(
            viewModel: DummyBillRowViewModel(
                description: "Description",
                participants: "Egor, Dima",
                sumOfBill: "50.00"
            )
        )
    }
}
