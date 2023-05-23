import Foundation
import SwiftUI

/// Responsible for managing the data associated with a BillRowView.
class BillRowViewModel: ObservableObject {
    /// Description of the bill, shows in the view.
    @Published var description = "Description"

    /// Participants of the bill to be shows in the view.
    @Published var participants = ["Participant 1", "Participant 2"]

    /// Total amount of the bill to be shows in the view.
    @Published var sumOfBill = "50.00"

    /// A formatted string representing the participants, separated by a comma.
    var formattedParticipants: String {
        participants.joined(separator: ", ")
    }
}
