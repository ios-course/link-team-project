import SwiftUI

/// A view for adding a bill,
struct AddBillView: View {
    var body: some View {
        ScrollView {
            DataInputFieldView(input: $sumOfBill,
                               label: howMuchFieldLabel,
                               placeholder: howMuchFieldPlaceholder,
                               keyboardType: .numberPad,
                               alignment: .leading)
                .padding()

            DataInputFieldView(input: $spendingDescription,
                               label: whatIsItFieldLabel,
                               placeholder: whatIsItFieldPlaceholder,
                               keyboardType: .default,
                               alignment: .leading)
                .padding()

            HStack(alignment: .top) {
                DataInputFieldView(input: $participantName,
                                   label: participantFieldLabel,
                                   placeholder: participantFieldPlaceholder,
                                   keyboardType: .default,
                                   alignment: .leading)

                Spacer()

                VStack {
                    DataInputFieldView(input: $paidAmount,
                                       label: paidFieldLabel,
                                       placeholder: paidFieldPlaceholder,
                                       keyboardType: .numberPad,
                                       alignment: .center)
                        .frame(maxWidth: paidFieldMaxWidth)

                    Button("") {}
                        .buttonStyle(BlackCircleWithPlusButton())
                        .padding(.top)
                }
            }
            .padding()

            DatePickerView(date: $selectedDate)
                .padding()

            Button(String.AppIconName.save) {}
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

    private let buttonVerticalIndent: CGFloat = 30
    private let buttonHorizontalIndent: CGFloat = 35
    private let paidFieldMaxWidth: CGFloat = 80
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}
