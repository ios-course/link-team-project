import SwiftUI

/// A view that allows to create a new bill to split.
/// The user can navigate back from the view.
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
                    Button(
                        action: {},
                        label: {
                            Image(systemName: .AppIconName.backwardChevron)
                        }
                    )
                    .foregroundColor(.black)
                }
            }
        }
    }

    // MARK: - Private interface

    private let titleText = "Add a new bill"
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}
