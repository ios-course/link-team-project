extension BillValidationError: Equatable {
    static func == (_ lhs: BillValidationError, _ rhs: BillValidationError) -> Bool {
        switch (lhs, rhs) {
        case let (.tooLongPersonName(name: nameLhs),
                  .tooLongPersonName(name: nameRhs)):
            return nameLhs == nameRhs

        case let (.emptyPersonName(name: nameLhs),
                  .emptyPersonName(name: nameRhs)):
            return nameLhs == nameRhs

        case let (.negativeAmountOfMoney(number: numberLhs),
                  .negativeAmountOfMoney(number: numberRhs)):
            return numberLhs == numberRhs

        case let (.moreThanTwoDecimalPlacesForMoney(amount: numberLhs),
                  .moreThanTwoDecimalPlacesForMoney(amount: numberRhs)):
            return numberLhs == numberRhs

        case let (.invalidSumOfBill(sum: numberLhs),
                  .invalidSumOfBill(sum: numberRhs)):
            return numberLhs == numberRhs

        case (.incorrectEstimatedSumOfTheBill,
              .incorrectEstimatedSumOfTheBill):
            return true

        case let (.theDateIsInFuture(dateLhs),
                  .theDateIsInFuture(dateRhs)):
            return dateLhs == dateRhs

        default:
            return false
        }
    }
}
