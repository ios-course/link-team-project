import SwiftUI

/// A view that displays the history of operations.
struct HistoryOfOperationsView: View {
    var body: some View {
        VStack {
            Button(action: {}) { // TODO: Add action.
                Text("Add")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            }
            .offset(x: 160, y: 20)

            Text("History of operations")
                .font(.system(size: 20))
                .padding(.top, 5)

            Divider()
                .background(Color.black)

            Spacer()

            BillListView()
        }
        .padding(.horizontal, 15)
    }
}

struct HistoryOfOperationsView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryOfOperationsView()
    }
}
