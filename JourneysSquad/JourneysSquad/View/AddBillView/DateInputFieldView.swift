import SwiftUI

struct DateInputFieldView: View {
    let name: String
    @Binding var value: Date

    var body: some View {
        VStack(alignment: .leading) {
            Text(name.uppercased())
                .font(.system(size: AddBillView.bodySize,
                              weight: .bold,
                              design: .rounded))
                .foregroundColor(.primary)

            Divider()

            DatePicker("", selection: $value, displayedComponents: .date)
                .accentColor(.primary)
                .border(Color("Border"), width: 1.0)
                .labelsHidden()
                .padding(.top)
        }
    }
}

struct DateFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DateInputFieldView(name: "Date", value: .constant(.now))
    }
}
