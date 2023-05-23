import SwiftUI

struct AddPersonPaidButton: View {
    let action: () -> Void = {}
    var body: some View {
        Button(action: action,
               label: {
                   Image(systemName: "plus")
                       .resizable()
                       .frame(width: 25, height: 25)
                       .padding(7)
                       .background(Color.black)
                       .foregroundColor(.white)
                       .clipShape(Circle())
               })
               .padding(Edge.Set.trailing, 40)
    }
}

struct AddPersonButton_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonPaidButton()
    }
}
