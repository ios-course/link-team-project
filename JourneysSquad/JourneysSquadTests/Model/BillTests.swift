import XCTest

final class BillTests: XCTestCase {
    func testInitCreatesAnObjectWhenValidParametersArePassed() {
        XCTAssertNoThrow(
            try Bill(personPaid: ["A": 1],
                     description: "Description",
                     sumOfBill: 1,
                     date: Date.now)
        )
    }

    func testInitCreatesAnObjectWhosePropertiesHaveTheValuesOfThePassedParameters() {
        let date = Date.now
        let bill = try? Bill(personPaid: ["A": 1],
                             description: "Description",
                             sumOfBill: 1,
                             date: date)

        XCTAssertEqual(bill?.personPaid, ["A": 1])
        XCTAssertEqual(bill?.description, "Description")
        XCTAssertEqual(bill?.sumOfBill, 1)
        XCTAssertEqual(bill?.date, date)
    }

    func testInitCreatesAnObjectWithUniqueIDEachTime() {
        let firstBill = try? Bill(personPaid: ["A": 1],
                                  description: "Description",
                                  sumOfBill: 1,
                                  date: Date.now)
        let secondBill = try? Bill(personPaid: ["A": 1],
                                   description: "Description",
                                   sumOfBill: 1,
                                   date: Date.now)

        XCTAssertNotEqual(firstBill?.id, secondBill?.id)
    }

    func testInitThrowsTooLongPersonNameErrorWhenOneOfNamesIsLongerThenMaxPersonNameLength() {
        let name = String(repeating: "A",
                          count: Bill.maxPersonNameLength + 1)

        XCTAssertThrowsError(
            try Bill(
                personPaid: [name: 1],
                description: "Description",
                sumOfBill: 1,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.tooLongPersonName(name: name))
        }
    }

    func testInitThrowsTooLongPersonNameErrorWhenMultipleNamesAreLongerThenMaxPersonNameLength() {
        let nameOne = String(repeating: "A", count: Bill.maxPersonNameLength + 1)
        let nameTwo = String(repeating: "B", count: Bill.maxPersonNameLength + 1)

        XCTAssertThrowsError(
            try Bill(
                personPaid: [nameOne: 1, nameTwo: 1],
                description: "Description",
                sumOfBill: 1,
                date: Date.now
            )
        ) { error in
            let actualError = error as? BillValidationError

            switch actualError {
            case let .tooLongPersonName(name: name):
                XCTAssertEqual(actualError,
                               BillValidationError.tooLongPersonName(name: name))
            default:
                XCTFail("Unexpected error")
            }
        }
    }

    func testInitThrowsEmptyPesonNameErrorWhenOneOfNamesIsEmptyString() {
        let name = ""

        XCTAssertThrowsError(
            try Bill(
                personPaid: [name: 1],
                description: "Description",
                sumOfBill: 1,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.emptyPersonName(name: name))
        }
    }

    func testInitThrowsEmptyPesonNameErrorWhenOneOfNamesContainOnlySpaces() {
        let name = " "

        XCTAssertThrowsError(
            try Bill(
                personPaid: [name: 1],
                description: "Description",
                sumOfBill: 1,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.emptyPersonName(name: name))
        }
    }

    func testInitThrowsEmptyPesonNameErrorWhenOneOfNamesContainsOnlySpacesAndAnotherNameIsEmpty() {
        let nameOne = ""
        let nameTwo = " "

        XCTAssertThrowsError(
            try Bill(
                personPaid: [nameOne: 1, nameTwo: 1],
                description: "Description",
                sumOfBill: 2,
                date: Date.now
            )
        ) { error in
            let actualError = error as? BillValidationError

            switch actualError {
            case let .emptyPersonName(name: name):
                XCTAssertEqual(actualError, BillValidationError.emptyPersonName(name: name))
            default:
                XCTFail("Unexpected error")
            }
        }
    }

    func testInitThrowsNegativeAmountOfMoneyErrorWhenThePersonPaidAmountIsLessThenZero() {
        let amount: Decimal = -1

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["name": amount, "name2": 2],
                description: "Description",
                sumOfBill: 1,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.negativeAmountOfMoney(number: amount))
        }
    }

    func testInitThrowsMoreThanTwoDecimalPlacesForMoneyErrorWhenPersonPaidAmountOfMoneyHasMoreThanTwoDecimalPlaces() {
        let amount: Decimal = 1.111

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["name": amount],
                description: "Description",
                sumOfBill: 1,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: amount))
        }
    }

    func testInitThrowsMoreThanTwoDecimalPlacesForMoneyErrorWhenTheSumOfBillHasMoreThanTwoDecimalPlaces() {
        let amount: Decimal = 1.111

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["name": 1],
                description: "Description",
                sumOfBill: amount,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: amount))
        }
    }

    func testInitThrowsInvalidSumOfBillErrorWhenSumOfBillIsLessThanZero() {
        let sum: Decimal = -1

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["name": 1],
                description: "Description",
                sumOfBill: sum,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.invalidSumOfBill(sum: sum))
        }
    }

    func testInitThrowsInvalidSumOfBillErrorWhenSumOfBillEqualsToZero() {
        let sum: Decimal = 0

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["name": 1],
                description: "Description",
                sumOfBill: sum,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.invalidSumOfBill(sum: sum))
        }
    }

    func testInitThrowsIncorrectEstimatedSumOfTheBilErrorlWhenSumOfBillIsNotEqualToSumOfPersonPaid() {
        XCTAssertThrowsError(
            try Bill(
                personPaid: ["name": 1],
                description: "Description",
                sumOfBill: 2,
                date: Date.now
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.incorrectEstimatedSumOfTheBill)
        }
    }

    func testInitThrowsTheDateIsInFutureErrorWhenTheInputDateIsInTheFuture() {
        let tenSecondsDuration: TimeInterval = 10
        let tenSecondsFromNowDate = Date.now + tenSecondsDuration

        XCTAssertThrowsError(
            try Bill(
                personPaid: ["name": 1],
                description: "Description",
                sumOfBill: 2,
                date: tenSecondsFromNowDate
            )
        ) { error in
            XCTAssertEqual(error as? BillValidationError,
                           BillValidationError.theDateIsInFuture(tenSecondsFromNowDate))
        }
    }
}
