/// Represents a node in a binary search tree.
final class BinarySearchTreeNode<T> {
    /// The value stored in the node.
    var value: T
    
    /// The left child node of the current node.
    var left: BinarySearchTreeNode<T>?
    
    /// The right child node of the current node.
    var right: BinarySearchTreeNode<T>?
    
    /// Creates a new node with a specified value.
    ///
    /// - Parameter value: The value to be stored in the node.
    init(_ value: T) {
        self.value = value
    }
}
