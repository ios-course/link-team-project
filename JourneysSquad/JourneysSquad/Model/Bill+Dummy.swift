import Foundation

extension Bill {
    /// Provides the lists of dummy bills.
    enum Dummy {
        /// The list of dummy bills.
        static let bills: [Bill] = {
            var bills = [Bill]()

            if let mac = try? Bill(
                personPaid: ["Kate": 10, "Vanya": 14],
                description: "Macdonalds",
                sumOfBill: 24,
                date: Date()
            ) {
                bills.append(mac)
            }
            if let burKing = try? Bill(
                personPaid: ["Kate": 13, "Alex": 17],
                description: "Burger King",
                sumOfBill: 30,
                date: Date()
            ) {
                bills.append(burKing)
            }
            if let rentCar = try? Bill(
                personPaid: ["Kate": 100, "Vanya": 100, "Said": 100],
                description: "Rent car",
                sumOfBill: 300,
                date: Date()
            ) {
                bills.append(rentCar)
            }
            if let rentHome = try? Bill(
                personPaid: ["Kate": 20, "Vanya": 25],
                description: "Book home",
                sumOfBill: 45,
                date: Date()
            ) {
                bills.append(rentHome)
            }
            if let taxi = try? Bill(
                personPaid: ["Kate": 10, "Vanya": 15],
                description: "Taxi to home",
                sumOfBill: 25,
                date: Date()
            ) {
                bills.append(taxi)
            }

            return bills
        }()
    }
}
