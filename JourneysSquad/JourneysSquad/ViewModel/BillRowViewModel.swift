/// Responsible for managing the data associated with a BillRowView.
final class BillRowViewModel {
    /// Description of the bill to be shown in the view.
    let description = "Description"

    /// List of the participants of the bill separated by a comma to be shown in the view.
    var participants: String {
        ["Participant 1", "Participant 2"].joined(separator: ", ")
    }

    /// Total amount of the bill to be shown in the view.
    let sumOfBill = "50.00"
}
