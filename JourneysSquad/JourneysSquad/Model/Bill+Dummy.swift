import Foundation

extension Bill {
    enum Dummy {
        static let mac = try? Bill(
            personPaid: ["Kate":10, "Vanya":14],
            description: "Macdonalds",
            sumOfBill: 24,
            date: Date()
        )
        static let burKing = try? Bill(
            personPaid: ["Kate":13, "Alex":17],
            description: "Burger King",
            sumOfBill: 30,
            date: Date()
        )
        static let rentCar = try? Bill(
            personPaid: ["Kate":100, "Vanya":100, "Said":100],
            description: "Rent car",
            sumOfBill: 300,
            date: Date()
        )
        static let rentHome = try? Bill(
            personPaid: ["Kate":20, "Vanya":25],
            description: "Book home",
            sumOfBill: 45,
            date: Date()
        )
        static let taxi = try? Bill(
            personPaid: ["Kate":10, "Vanya":15],
            description: "Taxi to home",
            sumOfBill: 25,
            date: Date()
        )
        static let tickets = try? Bill(
            personPaid: ["Kate": 50, "Vanya": 50, "Alex": 50, "Said": 50],
            description: "Plane tickets",
            sumOfBill: 200,
            date: Date()
        )
    }
}
