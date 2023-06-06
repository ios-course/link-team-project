/// Represents a double linked list data structure.
/// Provides methods to insert nodes at specific positions and append nodes to the end of the list.
/// Conforms to the Sequence protocol, allowing for easy iteration over the elements in the list.
/// The generic parameter T represents the type of the values stored in the linked list.
struct DoubleLinkedList<T> {
    /// Inserts a new node with the specified value before the given node.
    ///
    /// - Parameters:
    ///   - value: The value stored in the node to be inserted.
    ///   - node: The node before which the new node will be inserted.
    ///   If `node` is `nil` or equal to the current head node,
    ///   the new node will be inserted before the current head node, becoming the new head.
    ///   If the double linked list is empty (head is nil), the new node becomes the head and tail of the list.
    mutating func insert(value: T, before node: DoubleLinkedListNode<T>?) {
        let newNode = DoubleLinkedListNode(value: value)
        guard head != nil else {
            head = newNode
            return
        }

        if node === head || node == nil {
            newNode.next = head
//            head?.previous = newNode
            head = newNode
        } else {
            newNode.next = node
            newNode.previous = node?.previous
            node?.previous?.next = newNode
            node?.previous = newNode
        }
    }

    /// Adds a new node with the specified value to the end of the linked list.
    ///
    /// - Parameter value: The value to be added to the linked list.
    mutating func append(value: T) {
        let newNode = DoubleLinkedListNode(value: value)
        newNode.next = head
        head = newNode
    }

    // MARK: - Private interface

    private(set) var head: DoubleLinkedListNode<T>?
//    private(set) var tail: DoubleLinkedListNode<T>?
}
