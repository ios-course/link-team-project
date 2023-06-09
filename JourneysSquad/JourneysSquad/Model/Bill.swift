import Foundation

/// A statement of the money owed for goods or services by different people.
struct Bill {
    /// How much each person has paid within the bill.
    let personPaid: [String: Decimal]

    /// The description of the bill.
    let description: String

    /// The overall sum of money that was spent within the bill.
    let sumOfBill: Decimal

    /// A date when the bill was created.
    let date: Date

    /// The unique identifier for the bill.
    let id = UUID()

    /// Creates a new instance of bill.
    ///
    /// - Parameters:
    ///    - personPaid: The list of the people and according amount of money that each of them paid.
    ///    - description: The description of the bill.
    ///    - sumOfBill: The sum of money that was spent by participants within the bill.
    ///    - date: A date when the bill was created.
    ///
    /// - Throws: The `BillValidationError` if the bill can't be created because the
    /// passed parameters aren't sufficient or valid.
    init(
        personPaid: [String: Decimal],
        description: String,
        sumOfBill: Decimal,
        date: Date
    ) throws {
        try Bill.validateBill(personPaid: personPaid,
                              description: description,
                              sumOfBill: sumOfBill,
                              date: date)

        self.personPaid = personPaid
        self.description = description
        self.sumOfBill = sumOfBill
        self.date = date
    }

    private static func validateBill(
        personPaid: [String: Decimal],
        description: String,
        sumOfBill: Decimal,
        date: Date
    ) throws {
        if date > Date() { throw BillValidationError.theDateIsInFuture(date) }
        if sumOfBill <= 0 { throw BillValidationError.invalidSumOfBill(sum: sumOfBill) }
        if Bill.hasMoreThanTwoDecimalPlaces(sumOfBill) {
            throw BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: sumOfBill)
        }

        var sumOfAmountPaid: Decimal = 0

        for (personName, amountPaid) in personPaid {
            try Bill.validatePersonName(personName)

            if amountPaid < 0 {
                throw BillValidationError.negativeAmountOfMoney(number: amountPaid)
            }

            if Bill.hasMoreThanTwoDecimalPlaces(amountPaid) {
                throw BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: amountPaid)
            }

            sumOfAmountPaid += amountPaid
        }

        if sumOfBill != sumOfAmountPaid {
            throw BillValidationError.incorrectEstimatedSumOfTheBill
        }
    }

    private static func validatePersonName(_ name: String) throws {
        if name.count > Bill.maxPersonNameLength {
            throw BillValidationError.tooLongPersonName(name: name)
        }

        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            throw BillValidationError.emptyPersonName(name: name)
        }
    }

    private static func hasMoreThanTwoDecimalPlaces(_ number: Decimal) -> Bool {
        let decimalDigits = number.description.components(separatedBy: ".")
        return decimalDigits.count > 1 && decimalDigits[1].count > 2
    }
}

extension Bill {
    /// The max length of the person's name.
    static let maxPersonNameLength = 50
}
