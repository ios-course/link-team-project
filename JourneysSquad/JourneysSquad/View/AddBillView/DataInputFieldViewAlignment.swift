import SwiftUI

/// An alignment position of the elements inside `DataInputFieldView` along the horizontal axis.
///
/// Use to align views of the label and text field inside the root view.
enum DataInputFieldViewAlignment {
    /// Aligns the leading edges of views.
    case leading

    /// Aligns the centres of views.
    case center

    /// Aligns the trailing edges of views.
    case trailing

    /// The corresponding value of the `HorizontalAlignment`.
    var horizontalAlignment: HorizontalAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }

    /// The corresponding value of the `TextAlignment`.
    var textAlignment: TextAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
