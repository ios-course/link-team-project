import Foundation
/// Indicates error that can be caused by incorrect input data for the bill.
enum BillValidationError: LocalizedError {
    /// Indicates invalid participant's name.
    case invalidParticipantName(String)
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
        case let .invalidParticipantName(participant):
            return "Invalid participant name: \(participant)."
        case let .negativeValue(negativeSum):
            return "The money can't be negative: \(negativeSum)."
        case let .invalidFormatOfSum(invalidSum):
            return "Invalid format of the currency: \(invalidSum). Maximum accuracy is two decimal places."
        case .zeroSumOfBill:
            return "The sum of bill can't be equal to zero."
        case .balanceIsViolated:
            return "The sum of the bill must equal the sum of all the participants' sums."
        case let .futureDate(date):
            return "Error! This is a date in the future: \(date) ."
        }
    }
}
