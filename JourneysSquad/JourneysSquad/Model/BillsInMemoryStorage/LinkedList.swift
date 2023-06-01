import Foundation

/// Represents a linked list data structure.
struct LinkedList<T> {
    /// The head node of the linked list.
    private var head: LinkedListNode<T>?

    /// Inserts a new element into the linked list based on the provided condition.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - condition: The condition used to determine the insertion position.
    mutating func insertElement(_ value: T, basedOn condition: (T, T) -> Bool) {
        let newNode = LinkedListNode(value: value)

        if head == nil {
            head = newNode
            return
        }

        var currentNode = head
        var prevNode: LinkedListNode<T>?

        while let current = currentNode, condition(value, current.value) {
            prevNode = currentNode
            currentNode = currentNode?.next
        }

        if prevNode == nil {
            newNode.next = head
            head = newNode
        } else {
            newNode.next = prevNode?.next
            prevNode?.next = newNode
        }
    }
}
