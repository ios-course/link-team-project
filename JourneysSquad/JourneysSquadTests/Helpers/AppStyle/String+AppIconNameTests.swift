import XCTest

final class AppIconNameTests: XCTestCase {
    func testAppIconNamesHaveExpectedValue() {
        XCTAssertEqual(String.AppIconName.backwardChevron, "chevron.backward")
        // add new checks later...
    }
}
