import Foundation

/// In-memory storage to store the bills.
final class BillsInMemoryStorage {
    /// The shared instance of the bill storage.
    static let shared = BillsInMemoryStorage()
    
    /// A dictionary that maps dates to linked lists of bills.
    private var dateMap = [Date: LinkedList<Bill>]()
    
    private init() {}
    
    /// Adds a bill to the storage.
    /// - Parameter bill: The bill to be added.
    func addBill(_ bill: Bill) {
        guard let dateKey = bill.date.onlyDate else { return }
        
//        var billsForDay = billsFor[dateFromNewBill, default: LinkedList<Bill>()]
//        billsForDay.add(value: newBill)
//        billsFor.updateValue(billsForDay, forKey: dateFromNewBill)
        
        if var list = dateMap[dateKey] {
            list.add(value: bill)
        } else {
            var newList = LinkedList<Bill>()
            newList.add(value: bill)
            dateMap[dateKey] = newList
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
