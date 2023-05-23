import SwiftUI

struct AddBillView: View {
    @State private var spentAmount = ""
    @State private var purchaseDescription = ""
    @State private var participantName = ""
    @State private var paidAmount = ""
    @State private var selectedDate = Date()

    var body: some View {
        ScrollView {
            HowMuchView(inputAmount: $spentAmount)

            WhatIsIt(purchaseDescription: $purchaseDescription)
            Divider()
            ParticipantPaid(participantName: $participantName, paidAmount: $paidAmount)

            Divider()

            HStack {
                Spacer()

                AddParticipantPaidButton()
            }
            .padding(.vertical)

            DateView()

            Divider()
            
            Button(action: {},
                   label: {
                       Text("Save")
                            .bodyFont()
                           .frame(width: 150, height: 40)
                           .background(Color.black)
                           .foregroundColor(.white)
                           .cornerRadius(8)
                   })
                   .padding(.vertical, 16)
        }
    }
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}

// MARK: Views

struct HowMuchView: View {
    @Binding var inputAmount: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("How much")
                .bodyFont()
            // TODO: MaxFrameForFieldToInputMoney constant
            TextField("$0", text: $inputAmount)
                .fieldToInputMoney()

            Divider()
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
}

struct WhatIsIt: View {
    @Binding var purchaseDescription: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("What is it")
                .bodyFont()

            TextField("Describe your purchase", text: $purchaseDescription)
                // TODO: adjust
                .frame(width: 300)
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
}

struct ParticipantPaid: View {
    @Binding var participantName: String
    @Binding var paidAmount: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Participant")
                    .bodyFont()
                TextField("Name", text: $participantName)
                    .frame(width: 250)
            }

            Spacer()

            VStack(alignment: .leading) {
                Text("Paid")
                    .bodyFont()

                TextField("$0", text: $paidAmount)
                    .keyboardType(.decimalPad)
                    .frame(width: 60)
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
}

struct DateView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Date")
                .font(.headline)
                .padding(.top, 16)
            TextField("Today", text: .constant("Today"))
                .frame(width: 150)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
        }
    }
}

// MARK: Extensions

extension Text {
    func bodyFont() -> some View {
        font(.system(size: 20, design: .rounded))
    }
}

extension AddBillView {
    static let maxWidthOfFrameForFieldToInputMoney: CGFloat = 100
}

extension TextField {
    func fieldToInputMoney() -> some View {
        keyboardType(.decimalPad)
            .lineLimit(1)
            .frame(maxWidth: AddBillView.maxWidthOfFrameForFieldToInputMoney)
    }
}

// modifier for text as 'bold' Можно использовать для Button
// использовать spacing где alingnment

struct AddParticipantPaidButton: View {
    var body: some View {
        Button(action: {},
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
