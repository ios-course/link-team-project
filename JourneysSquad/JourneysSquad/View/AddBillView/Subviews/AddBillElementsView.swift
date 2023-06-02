import SwiftUI

/// A view for adding a bill,
struct AddBillElementsView: View {
    // MARK: - Internal interface

    var body: some View {
        ScrollView {
            LabelWithTextFieldView(
                input: $sumOfBill,
                labelText: howMuchFieldLabel,
                placeholderText: howMuchFieldPlaceholder,
                keyboardType: .numberPad
            )
            .padding()

            LabelWithTextFieldView(
                input: $spendingDescription,
                labelText: whatIsItFieldLabel,
                placeholderText: whatIsItFieldPlaceholder,
                keyboardType: .default
            )
            .padding()

            HStack(alignment: .top) {
                LabelWithTextFieldView(
                    input: $participantName,
                    labelText: participantFieldLabel,
                    placeholderText: participantFieldPlaceholder,
                    keyboardType: .default
                )

                Spacer()

                VStack {
                    LabelWithTextFieldView(
                        input: $paidAmount, labelText: paidFieldLabel,
                        placeholderText: paidFieldPlaceholder,
                        keyboardType: .numberPad,
                        labelAlignment: .center,
                        textFieldAlignment: .center
                    )
                    .frame(maxWidth: paidFieldMaxWidth)

                    Button("") {}
                        .buttonStyle(CircleWithPlusButton())
                        .frame(
                            width: circleWithPlusButtonFrameWidth,
                            height: circleWithPlusButtonFrameHeight
                        )
                        .padding(.top)
                }
            }
            .padding()

            LabelWithDatePickerView(
                date: $selectedDate,
                labelText: "Date"
            )
            .padding()

            Button(String.AppButtonLabelText.save) {}
                .buttonStyle(BlackRoundedRectangleButton())
                .padding()
        }
    }

    // MARK: - Private interface

    @State private var sumOfBill = ""
    @State private var spendingDescription = ""
    @State private var participantName = ""
    @State private var paidAmount = ""
    @State private var selectedDate = Date()

    private let howMuchFieldLabel = "How much?"
    private let howMuchFieldPlaceholder = "$0"
    private let whatIsItFieldLabel = "What is it?"
    private let whatIsItFieldPlaceholder = "Describe your spending"
    private let participantFieldLabel = "Participant"
    private let participantFieldPlaceholder = "Name"
    private let paidFieldLabel = "Paid"
    private let paidFieldPlaceholder = "$0"

    private let paidFieldMaxWidth: CGFloat = 100
    private let circleWithPlusButtonFrameWidth: CGFloat = 30
    private let circleWithPlusButtonFrameHeight: CGFloat = 30
}

struct AddBillElementsView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillElementsView()
    }
}
