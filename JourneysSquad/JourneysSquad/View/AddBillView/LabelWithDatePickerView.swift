import SwiftUI

/// A view that shows a date picker with the label containing a description text.
/// The date picker allows to select a specific day.
struct LabelWithDatePickerView: View {
    // MARK: - Internal interface

    /// The selected date that is shown in the view.
    @Binding var date: Date

    /// The text of the label.
    let labelText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(labelText)
                .font(.system(size: fontBodySize, weight: .bold))

            Divider()

            DatePicker(
                "",
                selection: $date,
                displayedComponents: .date
            )
            .labelsHidden()
        }
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}

struct LabelWithDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        LabelWithDatePickerView(date: .constant(Date()),
                                labelText: "Date")
    }
}
