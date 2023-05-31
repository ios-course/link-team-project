import XCTest

final class StringAppButtonLabelTextTests: XCTestCase {
    func testAppButtonLabelNameReturnsCorrectValue() {
        XCTAssertEqual(String.AppButtonLabelText.save, "Save")
    }
}
