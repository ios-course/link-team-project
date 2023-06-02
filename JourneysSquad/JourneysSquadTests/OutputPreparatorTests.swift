import XCTest

class OutputPreparatorTests: XCTestCase {
    func testMakeCommaSeparatedListReturnsSeparatedByCommaStringWithNames() {
        let input = ["Kate", "Vanya", "Alex"]
        let expectedOutput = "Kate, Vanya, Alex"

        let output = OutputPreparator.makeCommaSeparatedList(input)

        XCTAssertEqual(output, expectedOutput)
    }

    func testMakeCommaSeparatedListWithSpaces() {
        let input = ["Kate Johnson", "Vanya Petrov", "Alex Smith"]
        let expectedOutput = "Kate Johnson, Vanya Petrov, Alex Smith"

        let output = OutputPreparator.makeCommaSeparatedList(input)

        XCTAssertEqual(output, expectedOutput)
    }

    func testAddCurrencyKindWithUSD() {
        let number: Decimal = 123.45
        let expectedOutput = number.formatted(.currency(code: "USD"))

        let output = OutputPreparator.addCurrencyKind(to: number)

        XCTAssertEqual(output, expectedOutput)
    }
}
