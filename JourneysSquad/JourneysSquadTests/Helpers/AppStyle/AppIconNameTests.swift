import XCTest

final class AppIconNameTests: XCTestCase {
    func testAppIconNameReturnsCorrectValue() {
        let plusSystemName = "plus.circle"

        XCTAssertEqual(plusSystemName, String.AppIconName.plus)
    }
}
