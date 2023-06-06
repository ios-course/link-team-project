/// Represents a binary search tree data structure.
/// The generic parameter T represents the type of the values stored in the linked list.
final class BinarySearchTree<T: Comparable> {
    typealias Node = BinarySearchTreeNode<T>

    /// Initializes a new instance of the BinarySearchTree class.
    init() {}

    /// Inserts a new node into the binary search tree.
    ///
    /// - Parameter value: The value stored in the node to be inserted.
    func insert(_ value: T) {
        root = insert(value, in: root)
    }

    /// Try to find the first node that satisfies the given predicate.
    ///
    /// - Parameter predicate: A closure that takes a node and returns a boolean value
    /// indicating whether the node satisfies the condition.
    /// - Returns: The first node that satisfies the predicate, or `nil` if no such node is found.
    func first(where predicate: (Node) -> (Bool)) -> Node? {
        first(root, where: predicate)
    }

    /// Removes all nodes from the binary search tree.
    func removeAll() {
        root = nil
    }

    /// Returns an array of values in the binary search tree, obtained through an in-order traversal.
    ///
    /// - Returns: An array of values in the binary search tree.
    func values() -> [T] {
        inOrderTraversal(from: root)
    }

    // MARK: - Private interface

    private var root: Node?

    private func first(_ rootNode: Node?, where predicate: (Node) -> (Bool)) -> Node? {
        guard let rootNode else { return nil }
        if predicate(rootNode) { return rootNode }

        if let found = first(rootNode.left, where: predicate) { return found }
        if let found = first(rootNode.right, where: predicate) { return found }

        return nil
    }

    private func insert(_ value: T, in rootNode: Node?) -> Node {
        guard let rootNode else { return Node(value) }

        if value < rootNode.value {
            rootNode.left = insert(value, in: rootNode.left)
        } else {
            rootNode.right = insert(value, in: rootNode.right)
        }

        return rootNode
    }

    private func inOrderTraversal(from rootNode: Node?) -> [T] {
        guard let rootNode else { return [] }

        var values = [T]()
        values += inOrderTraversal(from: rootNode.left)
        values.append(rootNode.value)
        values += inOrderTraversal(from: rootNode.right)

        return values
    }
}

// MARK: - Internal interface

extension BinarySearchTree {
    convenience init(array: [T]) {
        self.init()

        array.forEach { insert($0) }
    }
}
