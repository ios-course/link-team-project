import Foundation
import SwiftUI

/// The view model for a bill responsible for preparing and providing data for the view.
class BillRowViewModel: ObservableObject {
    /// Description of the bill.
    @Published var dummyDescription = "Description"

    /// Participants between whom the amount of the bill is divided.
    @Published var dummyParticipants = ["Participant 1", "Participant 2"]

    /// Total amount of the bill.
    @Published var dummySumOfBill = "50.00"

    /// A formatted string representing the participants, separated by a comma.
    var formattedParticipants: String {
        dummyParticipants.joined(separator: ", ")
    }
}
