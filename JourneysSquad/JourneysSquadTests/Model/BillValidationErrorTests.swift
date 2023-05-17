import XCTest

final class BillValidationErrorTests: XCTestCase {
    func testErrorDescriptionPresentsInAPIForTooLongError() {
        _ = BillValidationError.tooLongParticipantName(name: "someLongName").errorDescription
        _ = BillValidationError.emptyParticipantName(name: " ").errorDescription
        _ = BillValidationError.negativeAmountOfMoney(number: 10).errorDescription
        _ = BillValidationError.invalidFormatOfMoneyAmount(number: 10.111).errorDescription
        _ = BillValidationError.incorrectSumOfBill(sum: 0)
        _ = BillValidationError.equalityIsViolated.errorDescription
    }
    
    func testErrorDescriptionReturnsCorrespondingMessageForTooLongParticipantNameError() {
        let name = "test"
        
        let expectedErrorDescription = "The name length exceeds 50 characters: \(name)."
        
        let actualErrorDescription = BillValidationError.tooLongParticipantName(name: name).errorDescription
        
        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }
    
    func testErrorDescriptionReturnsCorrespondingMessageForEmptyNameError() {
        let emptyName = " "
        
        let expectedErrorDescription = "The name: \(emptyName) contains only spaces or no one sign."
        
        let actualErrorDescription = BillValidationError.emptyParticipantName(name: emptyName).errorDescription
        
        XCTAssertEqual(actualErrorDescription, expectedErrorDescription)
    }
    
    func testErrorDescriptionReturnsCorrespondingMessageForNegativeAmountOfMoneyError() {
        let negativeAmount: Decimal = -4
        XCTAssertEqual(BillValidationError.negativeAmountOfMoney(number: negativeAmount).errorDescription,
                       "The money can't be negative: \(negativeAmount).")
    }
    
    func testErrorDescriptionReturnsCorrespondingMessageForInvalidFormatOfNumberError() {
        let number: Decimal = 1.123
        XCTAssertEqual(
            BillValidationError.invalidFormatOfMoneyAmount(number: number).errorDescription,
            """
            Invalid format of money amount: \(number). Maximum accuracy is two decimal places.
            """
        )
    }
    
    func testErrorDescriptionReturnsCorrespondingMessageForIncorrectSumOfBillError() {
        let incorrectSumOfBill: Decimal = 0
        XCTAssertEqual(BillValidationError.incorrectSumOfBill(sum: incorrectSumOfBill).errorDescription,
                       "Sum: \(incorrectSumOfBill) is less than or equal to zero.")
    }
    
    func testErrorDescriptionReturnsCorrespondingMessageForEqualityIsViolatedError() {
        XCTAssertEqual(BillValidationError.equalityIsViolated.errorDescription,
                       "The sum of the bill must equal the sum of all the participants's sums.")
    }
    
    func testErrorDescriptionReturnsCorrespondingMessageForFutureDateError() {
        let tenSecondsDuration: TimeInterval = 10
        let tenSecondsFromNowDate = Date.now + tenSecondsDuration
        XCTAssertEqual(BillValidationError.futureDate(tenSecondsFromNowDate).errorDescription,
                       "This is a date in the future: \(tenSecondsFromNowDate).")
    }
}
