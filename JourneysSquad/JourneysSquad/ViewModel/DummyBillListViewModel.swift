import Foundation

/// Dummy view model that provides data to display for the list of bills.
final class DummyBillListViewModel {
    /// A list of bills grouped into sections by date.
    let billsGroupedIntoSectionsByDate: [DummySectionViewModel] = [
        DummySectionViewModel(
            header: "2023-05-24",
            rows: [
                BillRowViewModel(Bill.Dummy.mac!),
                BillRowViewModel(Bill.Dummy.bk!),
            ]
        ),
        DummySectionViewModel(
            header: "2023-05-23",
            rows: [
                BillRowViewModel(Bill.Dummy.rentCar!),
            ]
        ),
        DummySectionViewModel(
            header: "2023-05-22",
            rows: [
                BillRowViewModel(Bill.Dummy.tickets!),
                BillRowViewModel(Bill.Dummy.taxi!),
                BillRowViewModel(Bill.Dummy.rentHome!),
            ]
        ),
    ]
}
