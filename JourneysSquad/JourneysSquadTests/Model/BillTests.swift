import XCTest

final class BillTests: XCTestCase {
    func testInitCreatesAnObjectWhenValidParametersArePassed() {
        XCTAssertNoThrow(
            try Bill(personPaid: ["A": 1],
                     description: "",
                     sumOfBill: 1,
                     date: .now)
        )
    }

    func testInitCreatesAnObjectWhosePropertiesHaveTheValuesOfThePassedParameters() {
        let initialPersonPaidList: [String: Decimal] = ["A": 1]
        let initialBillDescription = ""
        let initialSumOfBill: Decimal = 1
        let initialDate = Date.now

        let bill = try? Bill(personPaid: initialPersonPaidList,
                             description: initialBillDescription,
                             sumOfBill: initialSumOfBill,
                             date: initialDate)

        XCTAssertEqual(bill?.personPaid, initialPersonPaidList)
        XCTAssertEqual(bill?.description, initialBillDescription)
        XCTAssertEqual(bill?.sumOfBill, initialSumOfBill)
        XCTAssertEqual(bill?.date, initialDate)
    }

    func testInitCreatesAnObjectWithUniqueIDEachTime() {
        let firstBill = try? Bill(personPaid: ["A": 1],
                                  description: "",
                                  sumOfBill: 1,
                                  date: .now)
        let secondBill = try? Bill(personPaid: ["A": 1],
                                   description: "",
                                   sumOfBill: 1,
                                   date: .now)

        XCTAssertNotEqual(firstBill?.id, secondBill?.id)
    }

    func testInitThrowsTooLongPersonNameErrorWhenOneOfNamesIsLongerThanMaxPersonNameLength() {
        let nameLengthThatExceedsLimit = Bill.maxPersonNameLength + 1
        let nameThatExceedsMaxLength = String(repeating: "A",
                                              count: nameLengthThatExceedsLimit)
        let expectedError = BillValidationError.tooLongPersonName(name: nameThatExceedsMaxLength)

        XCTAssertThrowsError(
            try Bill(
                personPaid: [nameThatExceedsMaxLength: 1],
                description: "",
                sumOfBill: 1,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsTooLongPersonNameErrorWhenMultipleNamesAreLongerThanMaxPersonNameLength() {
        let nameLengthThatExceedsLimit = Bill.maxPersonNameLength + 1
        let nameThatExceedsMaxLengthOne = String(repeating: "A", count: nameLengthThatExceedsLimit)
        let nameThatExceedsMaxLengthTwo = String(repeating: "B", count: nameLengthThatExceedsLimit)

        XCTAssertThrowsError(
            try Bill(
                personPaid: [nameThatExceedsMaxLengthOne: 1, nameThatExceedsMaxLengthTwo: 1],
                description: "",
                sumOfBill: 1,
                date: .now
            )
        ) { error in
            guard case .tooLongPersonName = error as? BillValidationError else {
                XCTFail("Unexpected error \(error)")
                return
            }
        }
    }

    // swiftlint:disable:next line_length
    func testInitThrowsTooLongPersonNameErrorWithAccordingTriggeringNameWhenMultipleNamesAreLongerThanMaxPersonNameLength() {
        let nameLengthThatExceedsLimit = Bill.maxPersonNameLength + 1
        let tooLongName = String(repeating: "A", count: nameLengthThatExceedsLimit)
        let anotherTooLongName = String(repeating: "B", count: nameLengthThatExceedsLimit)
        let expectedPossibleErrors = [
            BillValidationError.tooLongPersonName(name: tooLongName),
            BillValidationError.tooLongPersonName(name: anotherTooLongName),
        ]

        XCTAssertThrowsError(
            try Bill(
                personPaid: [tooLongName: 1, anotherTooLongName: 1],
                description: "",
                sumOfBill: 1,
                date: .now
            )
        ) { error in
            guard let caughtError = error as? BillValidationError else {
                XCTFail("Unexpected error \(error)")
                return
            }
            XCTAssertTrue(expectedPossibleErrors.contains(caughtError))
        }
    }

    func testInitThrowsEmptyPersonNameErrorWhenOneOfNamesIsEmptyString() {
        let emptyName = ""
        let expectedError = BillValidationError.emptyPersonName(name: emptyName)

        XCTAssertThrowsError(
            try Bill(
                personPaid: [emptyName: 1],
                description: "",
                sumOfBill: 1,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsEmptyPersonNameErrorWhenOneOfNamesContainsOnlySpaces() {
        let nameContainingOnlySpaces = " "
        let expectedError = BillValidationError.emptyPersonName(name: nameContainingOnlySpaces)

        XCTAssertThrowsError(
            try Bill(
                personPaid: [nameContainingOnlySpaces: 1],
                description: "",
                sumOfBill: 1,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsEmptyPersonNameErrorWhenOneOfNamesContainsOnlySpacesAndAnotherNameIsEmpty() {
        let emptyName = ""
        let nameContainingOnlySpaces = " "

        XCTAssertThrowsError(
            try Bill(
                personPaid: [emptyName: 1, nameContainingOnlySpaces: 1],
                description: "",
                sumOfBill: 2,
                date: .now
            )
        ) { error in
            guard case .tooLongPersonName = error as? BillValidationError else {
                XCTFail("Unexpected error \(error)")
                return
            }
        }
    }

    func testInitThrowsNegativeAmountOfMoneyErrorWhenPersonPaidAmountOfMoneyIsLessThanZero() {
        let negativeAmountOfMoney: Decimal = -1
        let expectedError = BillValidationError.negativeAmountOfMoney(number: negativeAmountOfMoney)

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["A": negativeAmountOfMoney, "B": 2],
                description: "",
                sumOfBill: 1,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsMoreThanTwoDecimalPlacesForMoneyErrorWhenPersonPaidAmountOfMoneyHasMoreThanTwoDecimalPlaces() {
        let amountWithMoreThanTwoDecimalPlaces: Decimal = 1.111
        let expectedError =
            BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: amountWithMoreThanTwoDecimalPlaces)

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["A": amountWithMoreThanTwoDecimalPlaces],
                description: "",
                sumOfBill: 1,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsMoreThanTwoDecimalPlacesForMoneyErrorWhenSumOfBillHasMoreThanTwoDecimalPlaces() {
        let amountWithMoreThanTwoDecimalPlaces: Decimal = 1.111
        let expectedError =
            BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: amountWithMoreThanTwoDecimalPlaces)

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["A": 1],
                description: "",
                sumOfBill: amountWithMoreThanTwoDecimalPlaces,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsInvalidSumOfBillErrorWhenSumOfBillIsLessThanZero() {
        let negativeAmountOfBill: Decimal = -1
        let expectedError = BillValidationError.invalidSumOfBill(sum: negativeAmountOfBill)

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["A": 1],
                description: "",
                sumOfBill: negativeAmountOfBill,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsInvalidSumOfBillErrorWhenSumOfBillEqualsToZero() {
        let zeroAmountOfBill: Decimal = 0
        let expectedError = BillValidationError.invalidSumOfBill(sum: zeroAmountOfBill)

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["A": 1],
                description: "",
                sumOfBill: zeroAmountOfBill,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsIncorrectEstimatedSumOfTheBillErrorWhenSumOfBillIsNotEqualToSumOfPersonPaid() {
        let expectedError = BillValidationError.incorrectEstimatedSumOfTheBill

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["A": 1],
                description: "",
                sumOfBill: 2,
                date: .now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }

    func testInitThrowsTheDateIsInFutureErrorWhenTheInputDateIsInTheFuture() {
        let tenSecondsDuration: TimeInterval = 10
        let tenSecondsFromNowDate = Date.now + tenSecondsDuration
        let expectedError = BillValidationError.theDateIsInFuture(tenSecondsFromNowDate)

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["A": 1],
                description: "",
                sumOfBill: 2,
                date: tenSecondsFromNowDate
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError, expectedError)
        }
    }
}
