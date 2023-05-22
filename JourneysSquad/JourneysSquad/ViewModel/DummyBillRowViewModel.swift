import Foundation
import SwiftUI

/// The view model for a bill responsible for preparing and providing data for the view.
class BillRowViewModel: ObservableObject {
    /// Description of the bill.
    @Published var dummyDescription = "Description"

    /// Participants,who participate in the bill.
    @Published var dummyParticipants = ["Participant 1", "Participant 2"]

    /// Total amoun of the bill.
    @Published var dummySumOfBill = "50.00"

    /// A formatted string representing the members, separated by a comma.
    var formattedParticipants: String {
        dummyParticipants.joined(separator: ", ")
    }
}
