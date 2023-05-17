import Foundation

/// A statement of the money owed for goods or services by different people.
struct Bill {
    /// How much each participant has paid within the bill.
    let personPaid: [String: Decimal]

    /// The description of the bill.
    let description: String

    /// The sum of money that was spent by participants within the bill.
    let sumOfBill: Decimal

    /// A date when the bill was created.
    let date: Date

    /// The unique identifier for the bill.
    let id = UUID()

    /// Create a new instance of bill.
    ///
    /// - Parameters:
    ///    - personPaid: The list of the people and according amount of money that each of them paid.
    ///    - description: The description of the bill.
    ///    - sumOfBill: The sum of money that was spent by participants within the bill.
    ///    - date: A date when the bill was created.
    ///
    /// - Throws: The `BillValidationError` if the bill can't be created or doesn't make sense.
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
        description _: String,
        sumOfBill: Decimal,
        date: Date
    ) throws {
        guard date <= Date() else { throw BillValidationError.theDateIsInFuture(date) }

        guard sumOfBill > 0 else { throw BillValidationError.invalidSumOfBill(sum: sumOfBill) }

        guard !Bill.hasMoreThanTwoDecimalPlaces(sumOfBill) else {
            throw BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: sumOfBill)
        }

        for (participantName, spentAmount) in personPaid {
            try Bill.validateParticipantName(participantName)

            guard spentAmount >= 0 else {
                throw BillValidationError.negativeAmountOfMoney(number: spentAmount)
            }

            guard !Bill.hasMoreThanTwoDecimalPlaces(spentAmount) else {
                throw BillValidationError.moreThanTwoDecimalPlacesForMoney(amount: spentAmount)
            }
        }
    }

    private static func validateParticipantName(_ name: String) throws {
        guard name.count <= Bill.maxPersonNameLength else {
            throw BillValidationError.tooLongPersonName(name: name)
        }

        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
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
    private static let maxPersonNameLength = 50
}
