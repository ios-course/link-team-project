/// Represents a linked list data structure.
struct LinkedList<T> {
    /// Adds a new node with the specified value to the end of the linked list.
    /// - Parameter value: The value to be added to the linked list.
    mutating func add(value: T) {
        let newNode = LinkedListNode(value: value)
        tail?.next = newNode
        tail = newNode
    }

    // MARK: - Private

    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
}
