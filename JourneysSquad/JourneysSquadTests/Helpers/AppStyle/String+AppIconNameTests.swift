import XCTest

final class AppIconNameTests: XCTestCase {
    func testAppIconNameBackwardChevronEqualSystemImageChevronBackward() {
        let iconName = String.AppIconName.backwardChevron
        let systemImageName = "chevron.backward"

        XCTAssertEqual(iconName, systemImageName)
    }
}
