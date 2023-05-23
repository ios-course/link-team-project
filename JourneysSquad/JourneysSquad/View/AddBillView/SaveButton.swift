import SwiftUI

struct SaveButton: View {
    var body: some View {
        Button(action: {},
               label: {
            Text("Save")
            //                            .bodyFont()
                .frame(width: 150, height: 40)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
        })
    }
}
struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
    }
}
