import SwiftUI

/// View for adding new bill with input fields to enter details of a new bill.
/// Contain navigation bar with title and button `Back` now.
struct AddBillView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("")
            }
            .navigationTitle(titleText)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {},
                           label: {
                               Image(systemName: "chevron.backward")
                           })
                           .foregroundColor(.black)
                }
            }
        }
    }

    // MARK: - Private interface

    private let titleText = "Add new bill"
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}
