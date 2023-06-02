import Foundation

/// Praparator for data that shown un the `BillRowView`.
struct OutputPreparator {
    // MARK: - Internal interface

    /// Creates a string by joining the elements of an array with commas and spaces.
    ///
    /// - Parameter input: The array of strings to be joined.
    /// - Returns: A string containing the array elements separated by commas and spaces.
    static func makeCommaSeparatedList(_ input: [String]) -> String {
        input.joined(separator: ", ")
    }

    /// Adds a currency symbol to a decimal number and returns the formatted string representation.
    ///
    /// - Parameter number: The decimal number to which the currency symbol should be added.
    /// - Returns: A string representation of the decimal number with the currency symbol.
    static func addCurrencyKind(to number: Decimal) -> String {
        number.formatted(.currency(code: Self.currencyCode))
    }

    // MARK: - Private interface

    private static let currencyCode = "USD"
}
