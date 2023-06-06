import Foundation

/// Dummy view model that provides data to display for the list of bills.
final class DummyBillListViewModel {
    /// A list of bills grouped into sections by date.
    let billsGroupedIntoSectionsByDate: [DummySectionViewModel] =
        [
            DummySectionViewModel(
                header: "2023-05-24",
                rows: Bill.Dummy.twoBills.map { bill in
                    BillRowViewModel(bill: bill)
                }
            ),
            DummySectionViewModel(
                header: "2023-05-22",
                rows: Bill.Dummy.threeBills.map { bill in
                    BillRowViewModel(bill: bill)
                }
            ),
        ]
}
