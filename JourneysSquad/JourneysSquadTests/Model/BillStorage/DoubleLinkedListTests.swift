import XCTest

final class DoubleLinkedListTests: XCTestCase {
    func testAppendingToTheEmptyList() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.append(value: 10)

        XCTAssertEqual(linkedList.head?.value, 10)
        XCTAssertEqual(linkedList.tail?.value, 10)
    }

    func testAppendingMultipleValues() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.append(value: 10)
        linkedList.append(value: 5)
        linkedList.append(value: 0)

        XCTAssertEqual(linkedList.head?.value, 10)
        XCTAssertEqual(linkedList.tail?.value, 0)
    }

    func testAppendingWithDifferentType() {
        var linkedList = DoubleLinkedList<String>()

        linkedList.append(value: "Apple")
        linkedList.append(value: "Mango")
        linkedList.append(value: "Lemon")

        XCTAssertEqual(linkedList.head?.value, "Apple")
        XCTAssertEqual(linkedList.tail?.value, "Lemon")
    }

    func testInsertionToTheEmptyList() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.insert(value: 5, before: nil)

        XCTAssertEqual(linkedList.head?.value, 5)
        XCTAssertEqual(linkedList.tail?.value, 5)
    }

    func testInsertionWithMultipleValuesWhenNodeBeforeInsertIsNil() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.append(value: 3)
        linkedList.append(value: 7)
        linkedList.append(value: 10)
        linkedList.insert(value: 5, before: nil)

        XCTAssertEqual(linkedList.head?.value, 5)
    }

    func testInsertionBeforeHead() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.append(value: 10)
        guard let head = linkedList.head else {
            XCTFail("Head node is nil")
            return
        }

        linkedList.insert(value: 5, before: head)

        XCTAssertEqual(linkedList.head?.value, 5)
        XCTAssertEqual(linkedList.tail?.value, 10)
    }

    func testInsertionBeforeHeadWithMultipleValues() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.append(value: 10)
        linkedList.append(value: 5)
        linkedList.append(value: 0)

        guard let head = linkedList.head else {
            XCTFail("Head node is nil")
            return
        }

        linkedList.insert(value: 15, before: head)

        XCTAssertEqual(linkedList.head?.value, 15)
    }

    func testInsertionBeforeNode() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.append(value: 10)
        linkedList.append(value: 5)

        guard let tail = linkedList.tail else {
            XCTFail("Tail node is nil")
            return
        }

        linkedList.insert(value: 6, before: tail)

        XCTAssertEqual(linkedList.head?.value, 10)
        XCTAssertEqual(linkedList.tail?.value, 5)
        XCTAssertEqual(linkedList.head?.next?.value, 6)
    }

    func testInsertionBeforeNodeWithMultipleValues() {
        var linkedList = DoubleLinkedList<Int>()

        linkedList.append(value: 10)
        linkedList.append(value: 5)
        linkedList.append(value: 0)

        guard let nodeToInsertBefore = linkedList.head?.next else {
            XCTFail("The node before to insert is nil")
            return
        }
        linkedList.insert(value: 6, before: nodeToInsertBefore)

        XCTAssertEqual(linkedList.head?.next?.value, 6)
    }

    func testInsertionWithDifferentType() {
        var linkedList = DoubleLinkedList<String>()

        linkedList.append(value: "B")
        linkedList.append(value: "C")
        linkedList.append(value: "D")

        guard let head = linkedList.head else {
            XCTFail("Head node is nil")
            return
        }

        linkedList.insert(value: "A", before: head)

        XCTAssertEqual(linkedList.head?.value, "A")
        XCTAssertEqual(linkedList.tail?.value, "D")
    }
}
