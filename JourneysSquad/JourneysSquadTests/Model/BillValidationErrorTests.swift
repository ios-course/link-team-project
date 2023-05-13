import XCTest

final class BillValidationErrorTests: XCTestCase {
    func testErrorDescriptionPresentsInAPIForTooLongError() {
        _ = BillValidationError.tooLongName.errorDescription
    }

    func testErrorDescriptionPresentsInAPIForInvalidParticipantNameError() {
        _ = BillValidationError.noOneLetterInName("#@").errorDescription
    }

    func testErrorDescriptionPresentsInAPIFornegativeValueError() {
        _ = BillValidationError.balanceIsViolated.errorDescription
    }

    func testErrorDescriptionPresentsInAPIForNegativeValueError() {
        _ = BillValidationError.negativeValue(10).errorDescription
    }

    func testErrorDescriptionPresentsInAPIForInvalidFormatOfSumError() {
        _ = BillValidationError.invalidFormatOfSum(10).errorDescription
    }

    func testErrorDescriptionReturnsCorrespondingMessageForTooLondNameError() {
        XCTAssertEqual(BillValidationError.tooLongName.errorDescription,
                       "The maximum name length is 50 characters.")
    }

    func testErrorDescriptionReturnsCorrespondingMessageForNoOneLetterInNameError() {
        let incorrectName = "#@"
        XCTAssertEqual(BillValidationError.noOneLetterInName(incorrectName).errorDescription,
                       "The name: \(incorrectName) doesn't contain no one letter.")
    }

    func testErrorDescriptionReturnsCorrespondingMessageForNegativeValueError() {
        let negativeSum: Decimal = -4
        XCTAssertEqual(BillValidationError.negativeValue(negativeSum).errorDescription,
                       "The money can't be negative: \(negativeSum).")
    }

    func testErrorDescriptionReturnsCorrespondingMessageForInvalidFormatOfSumError() {
        let invalidFormattedSum: Decimal = 1.123
        XCTAssertEqual(
            BillValidationError.invalidFormatOfSum(invalidFormattedSum).errorDescription,
            """
            Invalid format of the currency: \(invalidFormattedSum). Maximum accuracy is two decimal places.
            """
        )
    }

    func testErrorDescriptionReturnsCorrespondingMessageForZeroSumOfBillError() {
        XCTAssertEqual(BillValidationError.zeroSumOfBill.errorDescription,
                       "The sum of bill can't be equal to zero.")
    }

    func testErrorDescriptionReturnsCorrespondingMessageForBalanceIsViolatedError() {
        XCTAssertEqual(BillValidationError.balanceIsViolated.errorDescription,
                       "The sum of the bill must equal the sum of all the participants's sums.")
    }

    func testErrorDescriptionReturnsCorrespondingMessageForfutureDateError() {
        let futureDate = Date.now + 10
        XCTAssertEqual(BillValidationError.futureDate(futureDate).errorDescription,
                       "Error! This is a date in the future: \(futureDate).")
    }
}
