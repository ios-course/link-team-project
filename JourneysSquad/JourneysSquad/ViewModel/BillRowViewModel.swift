import Foundation

/// Dummy view model that provides data to display for a list row.
final class BillRowViewModel: Identifiable {
    /// Description of the bill to be shown in the view.
    let description: String

    /// List of the participants of the bill.
    let participants: String

    /// Total amount of the bill to be shown in the view.
    let sumOfBill: String

    /// The bill's unique identifier.
    let id: UUID

    /// Initializes a new instance with the provided data.
    /// - Parameters:
    ///   - description: Description of the spending in the bill.
    ///   - participants:  A list of the participants' names involved in the bill.
    ///   - sumOfBill: Total amount of the bill.
    init(bill: Bill = Bill.Dummy.twoBills[0]) {
        description = bill.description
        let arrayOfParticipants = bill.personPaid.keys
        participants = arrayOfParticipants.joined(separator: ", ")
        sumOfBill = bill.sumOfBill.formatted(.currency(code: SupportedCurrency.usd))
        id = bill.id
    }
}
