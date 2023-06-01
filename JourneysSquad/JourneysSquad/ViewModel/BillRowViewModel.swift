import Foundation

/// Dummy view model that provides data to display for a list row.
final class BillRowViewModel: Identifiable, ObservableObject {
    // MARK: Internal interface

      /// Description of the bill to be shown in the view.
      @Published var description: String

      /// List of the participants of the bill separated by a comma to be shown in the view.
      @Published var participants: String

      /// Total amount of the bill to be shown in the view.
      @Published var sumOfBill: String

      var id: UUID

      init(_ bill: Bill) {
          self.bill = bill
          self.description = bill.description
          let participants = Array(bill.personPaid.keys)
          self.participants = OutputPreparator.makeCommaSeparatedList(participants)
          self.sumOfBill = OutputPreparator.addCurrencyKind(to: bill.sumOfBill)
          self.id = bill.id
      }

      // MARK: Private interface

      private var bill: Bill
  }
