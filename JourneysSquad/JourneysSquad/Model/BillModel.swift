import Foundation

/// Bill with related data.
struct Bill {
    /// How much each participant has spent within the bill.
    let participantSpent: [String: Decimal]

    /// The user's notes to the bill.
    let description: String

    /// The sum of money that was spent by participants within the bill.
    let sumOfBill: Decimal

    /// A date for the bill that was set up by the user.
    let date: Date

    /// The unique identifier for the bill.
    let id = UUID()

    // TODO: Documentation for the rest of API
    init(
        participantSpents: [String: Decimal],
        description: String,
        sumOfBill: Decimal,
        date: Date
    ) throws {
        try Bill.validateBill(participantSpent: participantSpents,
                              description: description,
                              sumOfBill: sumOfBill,
                              date: date)

        participantSpent = participantSpents
        self.description = description
        self.sumOfBill = sumOfBill
        self.date = date
    }

    private static func validateBill(
        participantSpent: [String: Decimal],
        description _: String,
        sumOfBill: Decimal,
        date: Date
    ) throws {
        guard date <= Date() else { throw BillValidationError.futureDate(date) }

        guard sumOfBill > 0 else { throw BillValidationError.incorrectSumOfBill(sum: sumOfBill) }

        guard !Bill.hasMoreThanTwoDecimalPlaces(sumOfBill) else {
            throw BillValidationError.invalidFormatOfMoneyAmount(number: sumOfBill)
        }

        for (participantName, spentAmount) in participantSpent {
            try Bill.validateParticipantName(participantName)

            guard spentAmount >= 0 else {
                throw BillValidationError.negativeAmountOfMoney(number: spentAmount)
            }

            guard !Bill.hasMoreThanTwoDecimalPlaces(spentAmount) else {
                throw BillValidationError.invalidFormatOfMoneyAmount(number: spentAmount)
            }
        }
    }

    private static func validateParticipantName(_ name: String) throws {
        guard name.count <= Bill.allowedParticipantNameLength else {
            throw BillValidationError.tooLongParticipantName(name: name)
        }

        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw BillValidationError.emptyParticipantName(name: name)
        }
    }

    private static func hasMoreThanTwoDecimalPlaces(_ number: Decimal) -> Bool {
        let decimalDigits = number.description.components(separatedBy: ".")
        return decimalDigits.count > 1 && decimalDigits[1].count > 2
    }
}

extension Bill {
    /// The allowed length of the description of the bill.
    static let allowedDescriptionLength = 50

    /// The allowed length of the participant's name.
    static let allowedParticipantNameLength = 50
}
