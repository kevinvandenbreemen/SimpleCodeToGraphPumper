import Foundation
import Logging

public class PumperMain {

    private let logger: Logger = Logger.init(label: String(describing: PumperMain.self))

    public init() {}

    public func pumpOut(with javaSourceString: String) -> Bool {

        //  Step 1:  Put together a file we can use
        let fileManager = FileManager()
        logger.debug("Operating in \(fileManager.currentDirectoryPath)")
        let filePathToWrite = "\(fileManager.currentDirectoryPath)/output/pumperMain.java"
        let filePath = URL.init(fileURLWithPath: filePathToWrite)

        do {
            try javaSourceString.write(to: filePath, atomically: true, encoding: .utf8)
        } catch let error {
            logger.error("Failed to write to url='\(filePath)' due to error:\n\(error)")
            return false
        }

        logger.info("Successfully wrote working java doclet to '\(filePath)'")

        return false
    }

}