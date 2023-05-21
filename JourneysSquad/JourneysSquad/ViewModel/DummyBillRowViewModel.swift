import Foundation
import SwiftUI

class BillRowViewModel: ObservableObject {
    @Published var dummyDescription = "Description"
    @Published var dummyParticipants = ["Participant 1", "Participant 2"]
    @Published var dummySumOfBill = "50.00"
}
