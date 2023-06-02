import Foundation

/// In-memory storage to store the bills.
final class BillsInMemoryStorage {
    private var list = LinkedList<BillsOfTheDay>()

    /// Adds a bill to the storage.
    /// - Parameter bill: The bill to be added.
    func addBill(_ bill: Bill) {
        let section = BillsOfTheDay(date: bill.date, bills: [bill])
        guard list.head != nil else {
            list.add(value: section)
            return
        }

        let billDate = bill.date

        for node in list {
            if node.value.date < billDate {
                list.insert(value: section, before: node)
            } else if node.value.date == billDate {
                node.value.bills.append(bill)
            } else {
                list.append(value: section)
            }
        }
    }
}

extension Date {
    /// Returns a new `Date` object with only the date component, discarding the time.
    var onlyDate: Date? {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.timeZone = TimeZone.current

        let dateString = formatter.string(from: self)
        return formatter.date(from: dateString)
    }
}
