import Foundation

/// Represents a linked list data structure.
struct LinkedList<T> {
    /// Adds a new node to the end of the linked list.
    /// - Parameter value: he value to be added to the linked list.
    mutating func add(value: T) {
        let newNode = LinkedListNode(value: value)
        tail?.next = newNode
        tail = newNode
    }

    // MARK: - Private interface

    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
}
