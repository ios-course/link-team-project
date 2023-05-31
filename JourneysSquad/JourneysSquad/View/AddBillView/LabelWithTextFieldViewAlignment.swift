import SwiftUI

/// An alignment position of the elements inside `LabelWithTextFieldView` along the horizontal axis.
///
/// Use to align views of the label and text field inside the root view.
enum LabelWithTextFieldViewAlignment {
    /// Aligns the leading edges of views.
    case leading

    /// Aligns the centres of views.
    case center

    /// Aligns the trailing edges of views.
    case trailing

    /// Value of `HorizontalAlignment` based on the alignment case.
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

    /// Value of `TextAlignment` based on the alignment case.
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
