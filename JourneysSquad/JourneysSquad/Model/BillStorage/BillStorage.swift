import Foundation

/// Storage to store bills.
class BillStorage {
    /// The shared instance of the bill storage.
    static let shared = BillStorage()

    /// Inserts a bill into the storage based on its date.
    /// - Parameter bill: The bill to be inserted.
    func insertBill(_ bill: Bill) {
        bills.insertElement(bill) { newBill, listBill in
            newBill.date >= listBill.date
        }
    }

    /// Retrieves all the bills from the storage.
    /// - Returns: An array containing all the bills in the storage.
    func getAllBills() -> [Bill] {
        var allBills = [Bill]()
        var currentNode = bills.head

        while let node = currentNode {
            allBills.append(node.value)
            currentNode = node.next
        }

        return allBills
    }

    // MARK: - Private interface

    private(set) var bills = LinkedList<Bill>()
}
