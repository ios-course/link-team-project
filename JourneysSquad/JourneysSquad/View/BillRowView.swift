import SwiftUI
/// A view displaying one bill.
struct BillRowView: View {

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                let description = "Description"
                if description.count > 20 {
                    Text(description.prefix(20) + "...")
                        .font(.system(size: 14))
                } else {
                    Text(description)
                        .font(.system(size: 14))
                }

                let participants = ["Participant 1", "Participant 2", "Participant 3"]
                    if participants.count > 2 {
                        Text("\(participants[0]), \(participants[1]), ...")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        } else {
                            Text(participants.joined(separator: ", "))
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
            }
            Spacer()
            Text("20.20 BYN")
                .font(.system(size: 14))
        }
        .padding(.horizontal, 10)
    }
}

struct BillRowView_Previews: PreviewProvider {
    static var previews: some View {
        BillRowView()
    }
}
