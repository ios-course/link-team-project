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
    
    /// Appends a CSV record to the end of the file.
    /// - Parameter csvRecord: A single row of CSV data to be written to the file.
    /// - Returns: True if the write was successful, false otherwise.
    func appendToTheFile(_ csvRecord: DataRecord) -> Bool {
        let csvString = csvRecord.joined(separator: ",")
        guard let result = try? csvString.write(to: filePath, atomically: false, encoding: defaultEncoding) else { return false
        }
        return true
    }
    
    func readAllData() -> [DataRecord]? {
        guard let rawString = try? String.init(contentsOf: filePath, encoding: defaultEncoding) else { return nil }
        let dataRecordStrings = rawString.split(whereSeparator: { $0.isNewline })
        let dataRecords = dataRecordStrings.map { $0.components(separatedBy: ",") }
        
        return dataRecords
    }
    
    // MARK: - Private interface
    /// The URL path to the CSV file.
    private let filePath: URL
    private let defaultEncoding = String.Encoding.utf8
    private let defaultExtention = "csv"
}
