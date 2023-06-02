import SwiftUI

/// Provides a convenient way to hide the keyboard when working with text fields
/// by tapping on the any place in the screen outside the keyboard.
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
