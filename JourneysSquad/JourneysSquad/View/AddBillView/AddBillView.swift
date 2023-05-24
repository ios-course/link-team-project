import SwiftUI

/// A view for adding a bill with various details such as the sum of the bill,
/// purchase description, person names, paid amount, and date.
struct AddBillView: View {
    @State private var sumOfBill = ""
    @State private var purchaseDescription = ""
    @State private var participantName = ""
    @State private var paidAmount = ""
    @State private var selectedDate = Date()

    var body: some View {
        ScrollView {
            DataInputFieldView(input: $sumOfBill,
                               labelOfField: "How much",
                               placeholder: "$0",
                               keyboardType: .default)

            DataInputFieldView(input: $purchaseDescription,
                               labelOfField: "What is it",
                               placeholder: "Describe your purchase",
                               keyboardType: .default)

            HStack {
                DataInputFieldView(input: $participantName,
                                   labelOfField: "Participant",
                                   placeholder: "Name",
                                   keyboardType: .default)

                Spacer()

                DataInputFieldView(input: $paidAmount,
                                   labelOfField: "Paid",
                                   placeholder: "$0",
                                   keyboardType: .numberPad)
                    .frame(maxWidth: paidFieldMaxWidth)
            }

            HStack {
                Spacer()
                Button {} label: {
                    CircleWithPlusView()
                }
            }
            .padding(EdgeInsets(top: buttonVerticalIndent,
                                leading: buttonHorizontalIndent,
                                bottom: buttonVerticalIndent,
                                trailing: buttonHorizontalIndent))

            HStack {
                DatePickFieldView(value: $selectedDate)
                Spacer()
            }
            .padding()

            Button {} label: {
                RoundedRectangleView(label: "Save")
                    .padding(.top, buttonVerticalIndent)
            }
        }
    }

    // MARK: - Private interface

    private let buttonVerticalIndent: CGFloat = 30
    private let buttonHorizontalIndent: CGFloat = 35
    private let paidFieldMaxWidth: CGFloat = 100
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}
