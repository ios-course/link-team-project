/// Represents a linked list data structure.
struct LinkedList<T> {
    /// Insert a new node with the specified value before the given node.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - node: The node after which the new node will be inserted.
    mutating func insert(value: T, before node: LinkedListNode<T>) {
        let newNode = LinkedListNode(value: value)
        newNode.next = node
        newNode.previos = node.previos
        node.previos?.next = newNode
        node.previos = newNode
    }
    
    /// Adds a new node with the specified value to the end of the linked list.
    /// - Parameter value: The value to be added to the linked list.
    mutating func append(value: T) {
        let newNode = LinkedListNode(value: value)
        tail?.next = newNode
        tail = newNode
    }
    
    // MARK: - Private
    
    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
}

extension LinkedList {
    /// Returns an array containing the values of the linked list in order.
    /// - Returns: An array of values in the linked list.
    func toArray() -> [T] {
        var array = [T]()
        var currentNode = head
        
        while let node = currentNode {
            array.append(node.value)
            currentNode = node.next
        }
        
        return array
    }
}

extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>?
    /// An array of values in the linked list.
    /// - Returns: The next node in the linked list, or nil if there are no more nodes.
    func next() -> LinkedListNode<T>? {
        current?.next
    }
}
