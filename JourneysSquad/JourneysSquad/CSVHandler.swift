import Foundation

typealias DataRecord = [String]

struct CSVHandler {

    init?(fileName: String) {}
    
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
