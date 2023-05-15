/// Enum of possible errors that may occur when working with CSV files.
enum CSVError: Error {
    /// File cannot be created at the specified URL.
    case cannotCreateFile
}
