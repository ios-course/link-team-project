/// Represents a node in a linked list.
class ListNode<T> {
    /// The value stored in the node.
    let value: T
    /// The reference to the next node in the list.
    var next: ListNode<T>?

    /// Creates a new instance of `ListNode`.
    /// - Parameter value: The value to be stored in the node.
    init(value: T) {
        self.value = value
    }
}
