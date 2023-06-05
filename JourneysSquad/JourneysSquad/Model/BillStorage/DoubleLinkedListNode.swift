/// Represents a node in a linked list.
final class DoubleLinkedListNode<T> {
    /// The value stored in the node.
    var value: T

    /// The reference to the next node in the list.
    var next: DoubleLinkedListNode<T>?

    /// The reference to the previous node in the list.
    var previous: DoubleLinkedListNode<T>?

    /// Creates a new node with a specified value.
    /// - Parameter value: The value to be stored in the node.
    init(value: T) {
        self.value = value
    }
}
