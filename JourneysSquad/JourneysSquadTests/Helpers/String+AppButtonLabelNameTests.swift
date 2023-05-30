import XCTest

final class AppButtonLabelNameTests: XCTestCase {
    func testAppButtonLabelNameReturnsCorrectValue() {
        let saveButtonLabelName = "Save"

        XCTAssertEqual(saveButtonLabelName, String.AppButtonLabelName.save)
    }
}
