import SwiftUI

/// A view displaying one bill.
struct BillRowView: View {

    var bill: DummyBillModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(bill.description)
                    .lineLimit(1)
                    .font(.system(size: 14))

                Text(bill.participants.joined(separator: ", "))
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            .padding(Edge.Set.trailing, 140)

            Text(bill.sum)
                .font(.system(size: 14))
                .lineLimit(1)
                .frame(maxWidth: 80)

        }
        .padding()
    }
}

struct BillRowView_Previews: PreviewProvider {
    static var previews: some View {
        BillRowView(bill: DummyBillModel())
    }
}
