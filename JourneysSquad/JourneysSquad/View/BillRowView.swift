import SwiftUI

/// A view displaying information of the one bill.
struct BillRowView: View {
    /// The view model responsible for providing data to the view.
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
            .padding(Edge.Set.trailing, 120)

            Text(viewModel.dummySumOfBill)
                .font(.system(size: 14))
                .lineLimit(1)
                .frame(maxWidth: 50)
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
