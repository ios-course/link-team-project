import XCTest

final class BillValidationErrorTests: XCTestCase {
    func testErrorDescriptionPresentsInAPI() {
        _ = BillValidationError.tooLongPersonName(name: "someLongName").errorDescription
        _ = BillValidationError.emptyPersonName(name: " ").errorDescription
        _ = BillValidationError.negativeAmountOfMoney(number: -10).errorDescription
        _ = BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: 10.111).errorDescription
        _ = BillValidationError.invalidSumOfBill(sum: 0)
        _ = BillValidationError.incorrectEstimatedSumOfTheBill.errorDescription
    }

    func testErrorDescriptionReturnsCorrespondingMessageForTooLongPersonNameError() {
        let name = "test"

        let expectedErrorDescription = "The length of the person's name exceeds the maximum allowed length: \(name)."

        let actualErrorDescription = BillValidationError.tooLongPersonName(name: name).errorDescription

        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }

    func testErrorDescriptionReturnsCorrespondingMessageForEmptyPersonNameError() {
        let name = " "

        let expectedErrorDescription = "The name: \(name) contains only spaces or no one sign."

        let actualErrorDescription = BillValidationError.emptyPersonName(name: name).errorDescription

        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }

    func testErrorDescriptionReturnsCorrespondingMessageForNegativeAmountOfMoneyError() {
        let amount: Decimal = -4

        let expectedErrorDescription = "The amount of money <= 0: \(amount)."

        let actualErrorDescription = BillValidationError.negativeAmountOfMoney(number: amount).errorDescription

        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }

    func testErrorDescriptionReturnsCorrespondingMessageForMoreThanTwoDecimalPlacesForMoneyError() {
        let amount: Decimal = 1.123

        let expectedErrorDescription = "The given amount of money has accuracy more than two decimal places: \(amount)."

        let actualErrorDescription =
            BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: amount).errorDescription

        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }

    func testErrorDescriptionReturnsCorrespondingMessageForInvalidSumOfBillError() {
        let sum: Decimal = 0

        let expectedErrorDescription = "Sum of bill is less than or equal to zero: \(sum)."

        let actualErrorDescription = BillValidationError.invalidSumOfBill(sum: sum).errorDescription

        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }

    func testErrorDescriptionReturnsCorrespondingMessageForIncorrectEstimatedSumOfTheBillError() {
        let expectedErrorDescription = "The sum of the bill doesn't equal the sum of all the participants's pays."

        let actualErrorDescription = BillValidationError.incorrectEstimatedSumOfTheBill.errorDescription

        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }

    func testErrorDescriptionReturnsCorrespondingMessageForTheDateIsInFutureError() {
        let tenSecondsDuration: TimeInterval = 10
        let tenSecondsFromNowDate = Date.now + tenSecondsDuration

        XCTAssertEqual(
            BillValidationError.theDateIsInFuture(tenSecondsFromNowDate).errorDescription,
            "This is a date in the future: \(tenSecondsFromNowDate)."
        )
    }
}
