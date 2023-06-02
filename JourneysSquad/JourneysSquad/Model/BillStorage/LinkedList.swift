/// Represents a linked list data structure.
struct LinkedList<T> {
    /// Insert after specified node
    mutating func insert(value: T, before node: LinkedListNode<T>) {
        let newNode = LinkedListNode(value: value)
        newNode.next = node
        newNode.previos = node.previos
        node.previos?.next = newNode
        node.previos = newNode
    }

    /// Add new node to the head.
    mutating func add(value: T) {
        let newNode = LinkedListNode(value: value)

        if var head {
            newNode.next = head
            head = newNode
        } else {
            head = newNode
        }
    }

    /// Adds a new node with the specified value to the end of the linked list.
    /// - Parameter value: The value to be added to the linked list.
    mutating func append(value: T) {
        let newNode = LinkedListNode(value: value)

        if var tail {
            tail.next = newNode
            tail = newNode
        } else {
            tail = newNode
        }
    }

    // MARK: - Private

    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
}

extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>?
    func next() -> LinkedListNode<T>? {
        current?.next
    }
}
