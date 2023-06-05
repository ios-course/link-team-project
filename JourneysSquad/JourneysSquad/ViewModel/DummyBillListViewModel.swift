import Foundation

/// Dummy view model that provides data to display for the list of bills.
final class DummyBillListViewModel {
    /// A list of bills grouped into sections by date.
    let billsGroupedIntoSectionsByDate: [DummySectionViewModel] =
        [
            DummySectionViewModel(
                header: "2023-05-24",
                rows: [
                    BillRowViewModel(bill: Bill.Dummy.bills[0]),
                    BillRowViewModel(bill: Bill.Dummy.bills[1]),
                ]
            ),
            DummySectionViewModel(
                header: "2023-05-23",
                rows: [
                    BillRowViewModel(bill: Bill.Dummy.bills[0]),
                ]
            ),
            DummySectionViewModel(
                header: "2023-05-22",
                rows: [
                    BillRowViewModel(bill: Bill.Dummy.bills[0]),
                    BillRowViewModel(bill: Bill.Dummy.bills[1]),
                    BillRowViewModel(bill: Bill.Dummy.bills[2]),
                ]
            ),
        ]
}
