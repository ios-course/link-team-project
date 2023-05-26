import Foundation

/// The instance of dummy list of bills to use in preview of views.
enum BillListDummyData {
    /// List with data that will be displayed in the preview.
    static let listData: [BillListViewModel] = [
        BillListViewModel(
            headerText: "2023-05-24",
            rows: [
                DummyBillRowViewModel(
                    description: "Description1",
                    participants: [
                        "Participant1",
                        "Participant2",
                        "Participant3",
                        "Participant4",
                    ],
                    sumOfBill: "94.40",
                    date: ""
                ),
                DummyBillRowViewModel(
                    description: "Description2",
                    participants: [
                        "Participant1",
                        "Participant2",
                    ],
                    sumOfBill: "202.23",
                    date: ""
                ),
            ]
        ),
        BillListViewModel(
            headerText: "2023-05-23",
            rows: [
                DummyBillRowViewModel(
                    description: "Description1",
                    participants: [
                        "Participant1",
                        "Participant2",
                        "Participant3",
                    ],
                    sumOfBill: "41.40",
                    date: ""
                ),
                DummyBillRowViewModel(
                    description: "Description2",
                    participants: [
                        "Participant1",
                        "Participant2",
                    ],
                    sumOfBill: "202.23",
                    date: ""
                ),
            ]
        ),
        BillListViewModel(
            headerText: "2023-05-20",
            rows: [
                DummyBillRowViewModel(
                    description: "Description3",
                    participants: [
                        "Participant1",
                        "Participant2",
                        "Participant3",
                    ],
                    sumOfBill: "25.12",
                    date: ""
                ),
            ]
        ),
        BillListViewModel(
            headerText: "2023-05-17",
            rows: [
                DummyBillRowViewModel(
                    description: "Description3",
                    participants: [
                        "Participant1",
                        "Participant2",
                    ],
                    sumOfBill: "66.50",
                    date: ""
                ),
                DummyBillRowViewModel(
                    description: "Description3",
                    participants: [
                        "Participant1",
                        "Participant2",
                        "Participant3",
                    ],
                    sumOfBill: "87.12",
                    date: ""
                ),
                DummyBillRowViewModel(
                    description: "Description3",
                    participants: [
                        "Participant1",
                        "Participant2",
                    ],
                    sumOfBill: "42.12",
                    date: ""
                ),
            ]
        ),
    ]
}
