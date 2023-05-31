import XCTest

final class StringAppIconNameTests: XCTestCase {
    func testAppIconNamesHaveExpectedValues() {
        XCTAssertEqual(String.AppIconName.circleWithPlusInCenter, "plus.circle")

        // add new checks later...
    }
}
