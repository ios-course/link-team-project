import Foundation

/// Responsible for managing the data to show list of bills.
final class SectionViewModel: Identifiable {
    /// The unique identifier of the section.
    var id: String { sectionHeader }

    /// Provides a text shown as a header of the section in the view.
    let sectionHeader: String

    /// An array of `DummyBillRowViewModel` objects representing the rows of the bill list.
    /// View model data for each row of the section.
    let rows: [DummyBillRowViewModel]

    /// Initializes a new instance of `SectionViewModel`.
    ///
    /// - Parameters:
    ///   - headerText: The header text of the section.
    ///   - rows: A list of the hardcoded bills those are grouped into the current section.
    init(headerText: String, rows: [DummyBillRowViewModel]) {
        self.sectionHeader = headerText
        self.rows = rows
    }
}
