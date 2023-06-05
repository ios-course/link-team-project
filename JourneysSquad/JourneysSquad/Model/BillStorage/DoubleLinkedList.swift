/// Represents a linked list data structure.
struct DoubleLinkedList<T> {
    /// Inserts a new node with the specified value before the given node.
    ///
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - node: The node before which the new node will be inserted.
    mutating func insert(value: T, before node: DoubleLinkedListNode<T>) {
        let newNode = DoubleLinkedListNode(value: value)

        if node === head {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            newNode.next = node
            newNode.previous = node.previous
            node.previous?.next = newNode
            node.previous = newNode
        }
    }

    /// Adds a new node with the specified value to the end of the linked list.
    ///
    /// - Parameter value: The value to be added to the linked list.
    mutating func append(value: T) {
        let newNode = DoubleLinkedListNode(value: value)
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode

        if head == nil {
            head = newNode
        }
    }

    // MARK: - Private interface

    private(set) var head: DoubleLinkedListNode<T>?
    private(set) var tail: DoubleLinkedListNode<T>?
}

extension DoubleLinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    var current: DoubleLinkedListNode<T>?
    func next() -> DoubleLinkedListNode<T>? {
        current?.next
    }
}
