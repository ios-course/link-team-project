import Foundation

/// An error that can be caused by incorrect input data for the bill.
enum BillValidationError: Error {
    /// Indicates too long person's name.
    ///
    /// - Parameter name: The name that exceeds allowed length and causes the error.
    case tooLongPersonName(name: String)

    /// Occurs when the person's name contains only spaces or no one character.
    ///
    /// - Parameter name: The name that causes the error.
    case emptyPersonName(name: String)

    /// Occurs when a negative number is passed for fields that reflects the amount of money and can't be such.
    ///
    /// - Parameter number: The negative number that causes the error.
    case negativeAmountOfMoney(number: Decimal)

    /// Occurs when the amount of decimal places in the number that is used to note money is greater than two.
    ///
    /// - Parameter number: The number whose format causes the error.
    case moreThanTwoDecimalPlacesForMoney(amount: Decimal)

    /// Indicates, that the overall sum of the bill is less than or equal to zero.
    ///
    /// - Parameter sum: The sum of the bill that causes the error.
    case invalidSumOfBill(sum: Decimal)

    /// Indicates that the sum of the bill doesn't equal the sum of all the person's pays.
    case incorrectEstimatedSumOfTheBill

    /// Occurs when the input date is in the future.
    case theDateIsInFuture(Date)
}

extension BillValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .tooLongPersonName(tooLongName):
            return "The length of the person's name exceeds the maximum allowed length: \(tooLongName)."
        case let .emptyPersonName(emptyPersonName):
            return "The name: \(emptyPersonName) contains only spaces or no one character."
        case let .negativeAmountOfMoney(negativeAmount):
            return "The amount of money <= 0: \(negativeAmount)."
        case let .moreThanTwoDecimalPlacesForMoney(number):
            return "The given amount of money has accuracy more than two decimal places: \(number)."
        case let .invalidSumOfBill(invalidSum):
            return "Sum of bill is less than or equal to zero: \(invalidSum)."
        case .incorrectEstimatedSumOfTheBill:
            return "The sum of the bill doesn't equal the sum of all the person's pays."
        case let .theDateIsInFuture(dateInFuture):
            return "This is a date in the future: \(dateInFuture)."
        }
    }
}

extension BillValidationError: Equatable {
    static func == (_ lhs: BillValidationError, _ rhs: BillValidationError) -> Bool {
        switch (lhs, rhs) {
        case let (.tooLongPersonName(name: string1),
                  .tooLongPersonName(name: string2)):
            return string1 == string2

        case let (.emptyPersonName(name: string1),
                  .emptyPersonName(name: string2)):
            return string1 == string2

        case let (.negativeAmountOfMoney(number: number1),
                  .negativeAmountOfMoney(number: number2)):
            return number1 == number2

        case let (.moreThanTwoDecimalPlacesForMoney(amount: number1),
                  .moreThanTwoDecimalPlacesForMoney(amount: number2)):
            return number1 == number2

        case let (.invalidSumOfBill(sum: number1),
                  .invalidSumOfBill(sum: number2)):
            return number1 == number2

        case (.incorrectEstimatedSumOfTheBill,
              .incorrectEstimatedSumOfTheBill):
            return true

        case let (.theDateIsInFuture(date1),
                  .theDateIsInFuture(date2)):
            return date1 == date2

        default:
            return false
        }
    }
}
