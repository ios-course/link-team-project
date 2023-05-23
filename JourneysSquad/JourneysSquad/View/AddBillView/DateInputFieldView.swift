import SwiftUI

/// A view that allows to select a calendar date.
struct DateInputFieldView: View {
    /// A date on the view.
    @Binding var value: Date

    var body: some View {
        VStack(alignment: .leading) {
            Text("Date".uppercased())
                .font(.system(size: fontBodySize,
                              weight: .bold,
                              design: .rounded))

            Divider()

            DatePicker("", selection: $value, displayedComponents: .date)
                .labelsHidden()
                .padding(.top)
        }
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
}

struct DateFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DateInputFieldView(value: .constant(.now))
    }
}
