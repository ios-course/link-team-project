import XCTest

final class StringAppIconNameTests: XCTestCase {
    func testAppIconNamesHaveExpectedValues() {
        XCTAssertEqual(String.AppIconName.circleWithPlusInCenter, "plus.circle")
    }
}
