import Foundation

/// Dummy view model that provides data to display for a bills list section.
final class DummySectionViewModel: Identifiable {
    /// The section's unique identifier.
    var id: String { header }

    /// A text shown as a header of the section in the view.
    let header: String

    /// Dummy data that provides a list of bills under the header of the section.
    let rows: [DummyBillRowViewModel]

    /// Initializes a new instance of the `SectionViewModel`.
    /// - Parameters:
    ///   - header: A header text of the section.
    ///   - rows: A static list of bills to show in the section.
    init(header: String, rows: [DummyBillRowViewModel]) {
        self.header = header
        self.rows = rows
    }
}
