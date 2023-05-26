import Foundation

/// Responsible for managing the data associated with a BillRowView.
class DummyBillRowViewModel: Identifiable {
    /// Description of the bill to be shown in the view.
    let description: String

    /// List of the participants of the bill separated by a comma to be shown in the view.
    let participants: [String]

    /// Total amount of the bill to be shown in the view.
    let sumOfBill: String

    /// Date of the bill.
    let date: String

    /// Unique identifier for the account.
    let id = UUID()

    /// A formatted string representing the participants, separated by a comma.
    var formattedParticipants: String {
        participants.joined(separator: ", ")
    }

    /// Initializes a new instance of BillRow with the provided information.
    ///
    /// - Parameters:
    /// - description: A string describing the bill.
    /// - participants: An array of strings representing the names of the participants involved in the bill.
    /// - sumOfBill: A string representing the total sum of the bill.
    /// - date: A string representing the date of the bill.
    init(description: String, participants: [String], sumOfBill: String, date: String) {
        self.description = description
        self.participants = participants
        self.sumOfBill = sumOfBill
        self.date = date
    }
}
