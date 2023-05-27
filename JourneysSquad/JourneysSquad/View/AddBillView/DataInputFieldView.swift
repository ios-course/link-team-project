import SwiftUI

/// A text field that allows to enter and edit text and has a label above itself.
struct DataInputFieldView: View {
    /// The text entered into the field.
    @Binding var input: String

    /// A label displayed above the field.
    let label: String

    /// A placeholder text displayed within the field.
    let placeholder: String

    /// A type of keyboard to display when the field is tapped.
    let keyboardType: UIKeyboardType

    /// An alignment of the label and the text field inside the view.
    let alignment: DataInputFieldViewAlignment

    var body: some View {
        VStack(alignment: alignment.horizontalAlignment) {
            Text(label)
                .font(.system(size: fontBodySize, weight: .bold))

            Divider()

            TextField(placeholder, text: $input)
                .font(.system(size: fontBodySize))
                .keyboardType(keyboardType)
                .lineLimit(dataInputFieldLineLimit)
                .multilineTextAlignment(alignment.textAlignment)
        }
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
    private let dataInputFieldLineLimit = 1
}

struct DataInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DataInputFieldView(input: .constant(""),
                           label: "Label",
                           placeholder: "Placeholder",
                           keyboardType: .default,
                           alignment: .leading)
    }
}
