import SwiftUI

/// A text field that allows to enter and edit text and has a label above itself.
struct LabelWithTextFieldView: View {
    /// The text entered into the field.
    @Binding var input: String

    /// A label displayed above the field.
    let label: String

    /// A placeholder text displayed within the field.
    let placeholder: String

    /// A type of keyboard to display when the field is tapped.
    let keyboardType: UIKeyboardType

    /// An alignment of the label and the text field inside the view.
    let alignment: LabelWithTextFieldViewAlignment

    var body: some View {
        VStack(alignment: alignment.horizontalAlignment) {
            Text(label)
                .font(.system(size: fontBodySize, weight: .bold))

            Divider()

            TextField(placeholder, text: $input)
                .font(.system(size: fontBodySize))
                .keyboardType(keyboardType)
                .lineLimit(textFieldLineLimit)
                .multilineTextAlignment(alignment.textAlignment)
        }
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
    private let textFieldLineLimit = 1
}

struct LabelWithTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LabelWithTextFieldView(
            input: .constant(""),
            label: "Label",
            placeholder: "Placeholder",
            keyboardType: .default,
            alignment: .leading
        )
        LabelWithTextFieldView(
            input: .constant("Here's a field with a quite long fancy text that doesn't fit on one line."),
            label: "Here's a label with a quite long fancy text that doesn't fit on one line.",
            placeholder: "Placeholder",
            keyboardType: .default,
            alignment: .leading
        )
    }
}
