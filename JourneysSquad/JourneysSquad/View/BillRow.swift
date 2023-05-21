import SwiftUI

/// A view displaying one bill.
struct BillRowView: View {

    @ObservedObject var viewModel: BillRowViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.dummyDescription)
                    .lineLimit(1)
                    .font(.system(size: 14))

                Text(viewModel.dummyParticipants.joined(separator: ", "))
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            .padding(Edge.Set.trailing, 100)

            Text(viewModel.dummySumOfBill)
                .font(.system(size: 14))
                .lineLimit(1)
                .frame(maxWidth: 80)
        }
        .padding()
    }
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BillRowViewModel()
        return BillRowView(viewModel: viewModel)
    }
}
