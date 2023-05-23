import SwiftUI

struct FieldToInputView: View {
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

//    init(input: Binding<String>,
//         labelOfField: String,
//         placeholder: String,
//         keyboardType: UIKeyboardType = .default) {
//        self.input = input
//        self.labelOfField = labelOfField
//        self.placeholder = placeholder
//    }
}

struct FieldToInputView_Previews: PreviewProvider {
    static var previews: some View {
        FieldToInputView(input: .constant("500"),
                         labelOfField: "Label",
                         placeholder: "Placeholder",
                         keyboardType: .numberPad)
    }
}
