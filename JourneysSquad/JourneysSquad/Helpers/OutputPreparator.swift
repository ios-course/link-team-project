import Foundation

struct OutputPreparator {
    static func makeCommaSeparatedList(_ input: [String]) -> String {
        input.joined(separator: ", ")
    }

    static func addCurrencyKind(to number: Decimal) -> String {
        number.formatted(.currency(code: "USD"))
    }
}
