import Foundation

/// Dummy view model for the BillListView.
class DummyBillListViewModel {
    /// A dummy list of bills grouped into sections by date.
    let listData: [DummySectionViewModel] = [
        DummySectionViewModel(
            headerText: "2023-05-24",
            rows: [
                DummyBillRowViewModel(
                    description: "Rent of an apartment",
                    participants: "Ivan, Egor, Sasha",
                    sumOfBill: "94.40"
                ),
                DummyBillRowViewModel(
                    description: "Dinner at the Mac",
                    participants: "Ivan, Ulia, Egor, Sasha",
                    sumOfBill: "202.23"
                ),
            ]
        ),

        DummySectionViewModel(
            headerText: "2023-05-23",
            rows: [
                DummyBillRowViewModel(
                    description: "Restaurant near center",
                    participants: "Ivan, Ulia, Egor",
                    sumOfBill: "50.12"

                ),
            ]
        ),

        DummySectionViewModel(
            headerText: "2023-05-22",
            rows: [
                DummyBillRowViewModel(
                    description: "Ticket to the zoo",
                    participants: "Ivan, Egor, Sasha",
                    sumOfBill: "66.50"
                ),
                DummyBillRowViewModel(
                    description: "Tickets to the cinema",
                    participants: "Ivan, Ulia, Egor, Sasha",
                    sumOfBill: "41.40"
                ),
                DummyBillRowViewModel(
                    description: "Breakfast",
                    participants: "Egor, Sasha",
                    sumOfBill: "20.23"
                ),
            ]
        ),
    ]
}
