import SwiftUI

/// A view that allows selecting a calendar date.
struct DatePickFieldView: View {
    /// The selected date that is shown in the view.
    @Binding var value: Date

    var body: some View {
        VStack(alignment: .leading) {
            Text("Date".uppercased())
                .font(.system(size: fontBodySize, weight: .bold, design: .rounded))

            Divider()

            DatePicker("", selection: $value, displayedComponents: .date)
                .labelsHidden()
                .padding(.top)
        }
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}

struct DatePickFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickFieldView(value: .constant(Date()))
    }
}
