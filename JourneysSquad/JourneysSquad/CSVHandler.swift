import Foundation

/// An array of strings representing a single row in a CSV file.
typealias CSVFileRow = [String]

/// Handles operations with  files that store data as a comma-separated values (CSV).
/// Example of CSV data:
/// "`John,Doe,120 jefferson st.,Riverside,NJ,08075
/// `Jack,McGinnis,220 hobo Av.,Phila,PA,09119`"

struct CSVHandler {
    /// Initializes a CSVHandler with a specified file name within the `Documents` directory.
    /// If a file with the same name already exists, the initializer will use the existing file,
    /// otherwise it will create a new file.
    /// If the file cannot be created or located, this initializer returns `nil`.
    /// - Parameter fileName: The name of the CSV file to store data.
    /// Don't need provide file extention to the name of file, ".csv" will be appended automatically.
    init?(fileName: String) {
        let fileManager = FileManager.default

        let documentsDirectory = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )

        let fileURL = documentsDirectory?
            .appending(path: fileName)
            .appendingPathExtension(csvExtention)

        guard let fileURL,
              fileManager.fileExists(atPath: fileURL.path) ||
              fileManager.createFile(atPath: fileURL.path, contents: nil)
        else {
            return nil
        }

        filePath = fileURL
    }

    /// Appends a CSV record to the end of the file. The record starts with a new line.
    /// - Parameter csvRecord: A single row of CSV data to be written to the file.
    /// - Returns: `true` if the write was successful, `false` otherwise.
    func appendToTheFile(_ row: CSVFileRow) -> Bool {
        let csvString = row.joined(separator: csvSeparator)
        let result: ()? = try? csvString.write(to: filePath, atomically: false, encoding: defaultEncoding)
        return result != nil
    }

    /// Reads all data from the CSV file.
    /// - Returns: A sequence of comma-separated strings in the order of appearance in the given CSV file,
    /// or `nil` if the file cannot be read.
    func readAllData() -> [CSVFileRow]? {
        guard let csvRawString = try? String(contentsOf: filePath, encoding: defaultEncoding) else { return nil }

        let csvRecordStrings = csvRawString.split(whereSeparator: { $0.isNewline })
        let csvRecords = csvRecordStrings.map { $0.components(separatedBy: csvSeparator) }

        return csvRecords
    }

    // MARK: - Private interface

    /// A path to the CSV file. Read/write operations are performed over the file at the path.
    private let filePath: URL

    /// The default encoding used for reading and writing CSV files.
    private let defaultEncoding = String.Encoding.utf8

    /// The default file extension for CSV files.
    private let csvExtention = "csv"

    /// The default separator used for joining CSV record elements.
    private let csvSeparator = ","
}
