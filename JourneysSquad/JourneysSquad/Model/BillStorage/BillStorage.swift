import Foundation

class BillStorage {
    static let shared = BillStorage()
    private(set) var bills: [Bill] = []
    var head: BillNode?
    
    private init() {
        self.head = nil
    }
    
    func appendTheBill(_ newBill: Bill) -> Bool {
        let newNode = BillNode(bill: newBill)
        
        if head == nil {
            head = newNode
            return true
        } else {
            var currentNode = head
            var previous: BillNode? = nil
            
            while let currentBill = currentNode, currentBill.bill.date >= newBill.date {
                previous = currentNode
                currentNode = currentBill.next
            }
            
            if previous == nil {
                newNode.next = head
                head = newNode
            } else {
                previous?.next = newNode
                newNode.next = currentNode
                return true
            }
        }
        return false
    }
}
