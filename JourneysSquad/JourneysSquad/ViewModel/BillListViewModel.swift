import Foundation

struct BillListViewModel: Identifiable {
    /// The unique identifier of the bill list view model.
    var id: String { return headerText }

    /// The header text shown at the top of the bill list.
    let headerText: String

    /// An array of `DummyBillRowViewModel` objects representing the rows of the bill list.
    let rows: [DummyBillRowViewModel]

    /// Initializes a new instance of `BillListViewModel`.
    ///
    /// - Parameters:
    ///   - headerText: The header text to be displayed.
    ///   - rows: An array of `DummyBillRowViewModel` objects representing the rows of the bill list.
    init(headerText: String, rows: [DummyBillRowViewModel]) {
        self.headerText = headerText
        self.rows = rows
    }
}
