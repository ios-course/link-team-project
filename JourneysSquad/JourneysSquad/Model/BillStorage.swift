import Foundation

class BillStorage {
    static let shared = BillStorage()
    private(set) var bills: [Bill]
    
    private init() {
        self.bills = []
    }
    
    func appendTheBill(_ newBill: Bill) -> Bool {
        let initialBillCount = bills.count
        bills.append(newBill)
        return bills.count > initialBillCount
    }
}
