/// Provides an iterator over the elements in a linked list.
struct LinkedListIterator<T>: IteratorProtocol {
    var current: DoubleLinkedListNode<T>?
    /// Advances to the next element and returns it, or nil if there are no more elements.
    ///
    /// - Returns: The next node in the linked list, or nil if there are no more nodes.
    func next() -> DoubleLinkedListNode<T>? {
        current?.next
    }
    
    /// Advances to the previous element and returns it, or nil if there are no more elements.
    ///
    /// - Returns: The previous element in the linked list, or nil if there are no more elements.
    func previous() -> DoubleLinkedListNode<T>? {
        current?.previous
    }
}

extension DoubleLinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(current: head)
    }
}
