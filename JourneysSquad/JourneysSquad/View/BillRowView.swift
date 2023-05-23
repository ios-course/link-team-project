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
                    .font(.system(size: 14))

                Text(viewModel.formattedParticipants)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            Spacer()

            Text(viewModel.dummySumOfBill)
                .font(.system(size: 14))
                .lineLimit(1)
        }
        .padding()
    }
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        let dummyBill = BillRowViewModel()
        BillRowView(viewModel: dummyBill)
    }
}
