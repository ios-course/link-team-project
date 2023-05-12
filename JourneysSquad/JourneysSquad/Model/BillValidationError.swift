import Foundation
/// Indicates error that can be caused by incorrect input data for the bill.
enum BillValidationError: LocalizedError {
    /// Indicates too long participant's name.
    case tooLongName
    /// Occurs when the participant's name doesn't contain no one letter.
    case noOneLetterInName(String)
    /// Occurs when negative value is passed for fields that  can't be such.
    case negativeValue(Decimal)
    /// Occurs when the number of decimal places is greater than two.
    case invalidFormatOfSum(Decimal)
    /// Indicates, that  the overall sum of the bill is equal to zero.
    case zeroSumOfBill
    /// Indicates that the overall sum of the bill isn't equal to the sum of the participants's sums.
    case balanceIsViolated
    /// Occurs when the input date is in the future.
    case futureDate(Date)
    /// The text message to output according to the error.
    var errorDescription: String? {
        switch self {
        case .tooLongName:
            return "The maximum name length is 50 characters."
        case let .noOneLetterInName(incorrectName):
            return "The name: \(incorrectName) doesn't contain no one letter."
        case let .negativeValue(negativeSum):
            return "The money can't be negative: \(negativeSum)."
        case let .invalidFormatOfSum(invalidFormattedSum):
            return "Invalid format of the currency: \(invalidFormattedSum). Maximum accuracy is two decimal places."
        case .zeroSumOfBill:
            return "The sum of bill can't be equal to zero."
        case .balanceIsViolated:
            return "The sum of the bill must equal the sum of all the participants's sums."
        case let .futureDate(futureDate):
            return "Error! This is a date in the future: \(futureDate)."
        }
    }
}
