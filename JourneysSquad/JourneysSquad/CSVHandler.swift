import Foundation

/// An array of strings representing a single row in a CSV file.
typealias DataRecord = [String]

/// Provides functionality to handle CSV files.
struct CSVHandler {
    
    /// Initializes a CSVHandler with a specified file name.  If the file cannot be created or located, this initializer returns `nil`.
    /// - Parameter fileName: The name of the CSV file to be handled.
    /// Don't need provide file extention to the name of file, ".csv" will be appended automatically.
    init?(fileName: String) {
        let fileManager = FileManager.default
        guard let documentsDirectory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else { return nil }
        let fileURL = documentsDirectory.appending(path: fileName).appendingPathExtension(defaultExtention)
        
        if !fileManager.fileExists(atPath: fileURL.path) {
            let createdSuccessfully = fileManager.createFile(atPath: fileURL.path, contents: nil)
            
            if !createdSuccessfully {
                return nil
            }
        }
        filePath = fileURL
    }
    
    func appendToTheFile(_ csvRecord: DataRecord) -> Bool {
       return true
    }
    
    func readAllData() -> [DataRecord]? {
        return [[]]
    }
    
    // MARK: - Private interface
    /// The URL path to the CSV file.
    private let filePath: URL
    private let defaultEncoding = String.Encoding.utf8
    private let defaultExtention = "csv"
}
