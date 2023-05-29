import Foundation

/// Dummy view model for a section of a list of bills.
final class DummySectionViewModel: Identifiable {
    /// The unique identifier of a section.
    var id: String { sectionHeader }

    /// Provides a text shown as a header of the section in the view.
    let sectionHeader: String

    /// Dummy data that provides a list of bills under the header of the section.
    let rows: [DummyBillRowViewModel]

    /// Initializes a new instance of the `SectionViewModel`.
    ///
    /// - Parameters:
    ///   - headerText: A header text of the section.
    ///   - rows: A list of hardcoded bills those are grouped into the current section.
    init(headerText: String, rows: [DummyBillRowViewModel]) {
        sectionHeader = headerText
        self.rows = rows
    }

    /// A dummy instance of the section.
    static let dummyBillSectionViewModelInstance = BillSectionView(
        sectionViewModel: DummySectionViewModel(
            headerText: "2023-05-23",
            rows: [
                DummyBillRowViewModel(
                    description: "Restaurant near center",
                    participants: "Ivan, Ulia, Egor",
                    sumOfBill: "50.12"
                ),
            ]
        )
    )
}