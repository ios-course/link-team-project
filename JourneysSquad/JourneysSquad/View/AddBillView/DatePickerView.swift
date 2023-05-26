import SwiftUI

/// A view with the label `Date` that allows selecting a calendar date by tapping on the field below the label.
struct DatePickerView: View {
    /// The selected date that is shown in the view.
    @Binding var date: Date

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
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
    private let label = "Date"
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(date: .constant(Date()))
    }
}
