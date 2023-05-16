import SwiftUI

/// A view that displays a list of bills grouped by date.
struct BillListView: View {
    var bills: BillsModel = .init()

    /// A computed property that groups the bills by date.
    var groupedBills: [String: [[String: Any]]] {
        Dictionary(grouping: bills.items) { bill in
            (bill["date"] as? String) ?? ""
        }
    }

    var body: some View {
        List {
            // Iterate over each group of bills, sorted by date in descending order.
            ForEach(groupedBills.sorted(by: { $0.key > $1.key }), id: \.key) { date, bills in
                Section(header: Text(date)
                    .frame(maxWidth: .infinity, alignment: .center)) {
                        // Iterate over each bill in the group.
                        ForEach(bills.indices, id: \.self) { index in
                            if let description = bills[index]["description"] as? String,
                               let amount = bills[index]["amount"] as? Double,
                               let participants = bills[index]["participants"] as? [String] {
                                VStack(alignment: .leading) {
                                    HStack {
                                        // Display the description, truncated with an ellipsis if it exceeds 20 characters.
                                        if description.count > 20 {
                                            Text(description.prefix(20) + "...")
                                                .lineLimit(1)
                                                .font(.system(size: 14))
                                        } else {
                                            Text(description)
                                                .lineLimit(1)
                                                .font(.system(size: 14))
                                        }

                                        Spacer()

                                        // Display the amount and currency.
                                        Text("\(amount, specifier: "%.2f")")
                                            .font(.system(size: 14))
                                            .offset(y: 5) // Offset the position of the amount vertically

                                        Text("BYN")
                                            .font(.system(size: 14))
                                            .offset(y: 5) // Offset the position of the currency vertically
                                    }

                                    // Display the participants' names, truncated with an
                                    // ellipsis if there are more than 2 participants.
                                    if participants.count > 0 {
                                        Text(participants.joined(separator: ", "))
                                            .lineLimit(1)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            }
                        }
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
