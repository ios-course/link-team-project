import XCTest

private struct Data {
    let date: Date
    let values: [String]
}

extension Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        lhs.date < rhs.date
    }
}

final class BinarySearchTreeTests: XCTestCase {
    private var bst = BinarySearchTree<Data>()

    override func setUp() {
        bst = BinarySearchTree<Data>()
    }

    override func tearDown() {
        bst.removeAll()
    }

    func testEmptyTree() {
        XCTAssertTrue(bst.values().isEmpty)
    }

    func testMethodInsertCorrectlyInsertsEachValue() {
        let data = [
            Data(date: .now.addingTimeInterval(0), values: ["A", "B", "C"]),
            Data(date: .now.addingTimeInterval(20), values: ["D", "E"]),
            Data(date: .now.addingTimeInterval(-20), values: ["F", "G", "H"]),
        ]

        bst = BinarySearchTree()
        data.forEach { bst.insert($0) }

        XCTAssertEqual(bst.values(), data.sorted())
    }

    func testMethodInsertHandleDuplicateValue() {
        let data = [
            Data(date: .now.addingTimeInterval(0), values: ["A", "B", "C"]),
            Data(date: .now.addingTimeInterval(20), values: ["D", "E"]),
            Data(date: .now.addingTimeInterval(0), values: ["A", "B", "C"]),
        ]

        bst = BinarySearchTree()
        data.forEach { bst.insert($0) }

        XCTAssertEqual(bst.values(), data.sorted())
    }

    func testMethodValuesReturnsValuesInCorrectOrder() {
        let data = [
            Data(date: .now.addingTimeInterval(0), values: ["A", "B", "C"]),
            Data(date: .now.addingTimeInterval(20), values: ["D", "E"]),
            Data(date: .now.addingTimeInterval(-20), values: ["F", "G", "H"]),
        ]

        bst = BinarySearchTree(array: data)

        XCTAssertEqual(bst.values(), data.sorted())
    }

    func testMethodFirstReturnsNilWhenTheTreeIsEmpty() {
        let searchResult = bst.first(where: { $0.value.date == .now.addingTimeInterval(100) })

        XCTAssertNil(searchResult)
    }

    func testMethodFirstReturnsTheCorrectNode() {
        let data = [
            Data(date: .now.addingTimeInterval(0), values: ["A", "B", "C"]),
            Data(date: .now.addingTimeInterval(20), values: ["D", "E"]),
            Data(date: .now.addingTimeInterval(-20), values: ["F", "G", "H"]),
        ]

        bst = BinarySearchTree(array: data)

        let searchResult = bst.first(where: { $0.value.date == data[1].date })

        XCTAssertEqual(searchResult?.value, data[1])
    }

    func testMethodFirstReturnsNilWhenThereIsNoSatisfyingNode() {
        let data = [
            Data(date: .now.addingTimeInterval(0), values: ["A", "B", "C"]),
            Data(date: .now.addingTimeInterval(20), values: ["D", "E"]),
            Data(date: .now.addingTimeInterval(-20), values: ["F", "G", "H"]),
        ]

        bst = BinarySearchTree(array: data)

        let searchResult = bst.first(where: { $0.value.date == .now.addingTimeInterval(100) })

        XCTAssertNil(searchResult)
    }

    func testRemoveAllNodes() {
        let data = [
            Data(date: .now.addingTimeInterval(0), values: ["A", "B", "C"]),
            Data(date: .now.addingTimeInterval(20), values: ["D", "E"]),
            Data(date: .now.addingTimeInterval(-20), values: ["F", "G", "H"]),
        ]

        bst = BinarySearchTree()
        data.forEach { bst.insert($0) }
        bst.removeAll()

        XCTAssertTrue(bst.values().isEmpty)
    }
}
