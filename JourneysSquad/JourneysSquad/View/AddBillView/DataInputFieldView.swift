import SwiftUI

struct DataInputFieldView: View {
    @Binding var input: String
    let labelOfField: String
    let placeholder: String
    let keyboardType: UIKeyboardType

    var body: some View {
        VStack(alignment: .leading) {
            Text(labelOfField.uppercased())
                .font(.system(size: AddBillView.bodySize, weight: .bold, design: .rounded))

            Divider()

            TextField(placeholder, text: $input)
                .font(.system(size: AddBillView.bodySize, weight: .medium, design: .rounded))
                .keyboardType(.decimalPad)
                .lineLimit(1)
                .padding(.top)
        }
        .padding()
    }
}

struct FieldToInputView_Previews: PreviewProvider {
    static var previews: some View {
        DataInputFieldView(input: .constant("500"),
                         labelOfField: "Label",
                         placeholder: "Placeholder",
                         keyboardType: .default)
    }
}
