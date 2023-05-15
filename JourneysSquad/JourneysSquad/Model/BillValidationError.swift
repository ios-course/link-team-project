import Foundation

/// An error that can be caused by incorrect input data for the bill.
enum BillValidationError: Error {
    /// Indicates too long participant's name.
    ///
    /// - Parameter name: The name that exceeds allowed length and causes the error.
    case tooLongParticipantName(name: String)

    /// Occurs when the participant's name contains only spaces or no one character.
    ///
    /// - Parameter name: The name that causes the error.
    case emptyParticipantName(name: String)

    /// Occurs when a negative number is passed for fields that reflects the amount of money and can't be such.
    ///
    /// - Parameter number: The negative number that causes the error.
    case negativeAmountOfMoney(number: Decimal)

    /// Occurs when the amount of decimal places in the number that is used to note money is greater than two.
    ///
    /// - Parameter number: The number whose format causes the error.
    case invalidFormatOfMoneyAmount(number: Decimal)

    /// Indicates, that the overall sum of the bill is less than or equal to zero.
    ///
    /// - Parameter sum: The sum of the bill that causes the error.
    case incorrectSumOfBill(sum: Decimal)

    /// Indicates that the overall sum of the bill isn't equal to the sum of the participants's sums.
    case equalityIsViolated

    /// Occurs when the input date is in the future.
    case futureDate(Date)
}

extension BillValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .tooLongParticipantName(tooLongName):
            return "The name length exceeds 50 characters: \(tooLongName)."
        case let .emptyParticipantName(emptyName):
            return "The name: \(emptyName) contains only spaces or no one sign."
        case let .negativeAmountOfMoney(negativeAmount):
            return "The money can't be negative: \(negativeAmount)."
        case let .invalidFormatOfMoneyAmount(invalidFormattedNumber):
            return "Invalid format of money amount: \(invalidFormattedNumber). Maximum accuracy is two decimal places."
        case let .incorrectSumOfBill(incorrectSum):
            return "Sum: \(incorrectSum) is less than or equal to zero."
        case .equalityIsViolated:
            return "The sum of the bill must equal the sum of all the participants's sums."
        case let .futureDate(futureDate):
            return "This is a date in the future: \(futureDate)."
        }
    }
}
