import Foundation

/// Provides functionality to handle CSV files.
struct CSVHandler {
    
    /// The URL path to the CSV file.
    private let path: URL
    
    /// Initializes a CSVHandler with a specified file name.
    /// - Parameter fileName: The name of the CSV file to be handled.
    init(fileName: String) throws {
        
        let fileManager = FileManager.default
        let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentsDirectory.appending(path: fileName).appendingPathExtension("csv")
        
        if !fileManager.fileExists(atPath: fileURL.path) {
            let createdSuccessfully = fileManager.createFile(atPath: fileURL.path, contents: nil)
            
            if !createdSuccessfully {
                throw CSVError.cannotCreateFile
            }
        }
        path = fileURL
    }
    
    func writeToTheFile(_: [[String]]) throws {
        // implement
    }
    
    func readAllData() throws -> [[String]] {
        [[]]
    }
}
