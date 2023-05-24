import SwiftUI

/// A field to enter text with a label above one.
struct DataInputFieldView: View {
    /// The text entered in the field.
    @Binding var input: String

    /// The label displayed above the field.
    let labelOfField: String

    /// The placeholder text displayed within the field.
    let placeholder: String

    /// The type of keyboard to display when the field is tapped.
    let keyboardType: UIKeyboardType

    var body: some View {
        VStack(alignment: .leading) {
            Text(labelOfField.uppercased())
                .font(.system(size: fontBodySize, weight: .bold, design: .rounded))

            Divider()

            TextField(placeholder, text: $input)
                .font(.system(size: fontBodySize, weight: .medium, design: .rounded))
                .keyboardType(keyboardType)
                .lineLimit(dataInputFieldLineLimit)
                .padding(.top)
        }
        .padding()
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
    private let dataInputFieldLineLimit = 1
}

struct DataInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DataInputFieldView(input: .constant(""),
                           labelOfField: "Label",
                           placeholder: "Placeholder",
                           keyboardType: .default)
    }
}
