import Foundation
import Logging
import ShellOut

public class PumperMain {

    private let logger: Logger = Logger.init(label: String(describing: PumperMain.self))

    public init() {}

    /// Executes the main setup to allow this library to work in your environment.  Note that this will
    /// trigger things like file downloads etc.  If it fails it will display a few error messages instructing
    /// you on what to do next.
    public func executeSetup() -> Bool {

        do {
            let path = try shellOut(to: "find", arguments: [".build/checkouts", "-name", "SimpleCodeToGraphPumper"])

            if !path.isEmpty {
                logger.info("Code to Graph Pumper located in directory \(path)")
                logger.info("Attempting to set up pumper environment in base directory of the project...")
                try shellOut(to: "make", arguments: ["setup"], at: path)
                try shellOut(to: "cp", arguments: ["-r", "\(path)/scripts", "."])
                try shellOut(to: "cp", arguments: ["-r", "\(path)/cp", "."])
                try shellOut(to: "cp", arguments: ["-r", "\(path)/run.sh", "."])
            }
            else {
                logger.info("Configuring the pumper for standalone execution...")
                try shellOut(to: "make", arguments: ["setup"])
            }
            
        } catch let error {
            logger.error("Failed to configure the code pumper!\n\(error)")
            return false
        }

        return true
    }

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

        //  Step 2:  Run the pumper
        do {
            try shellOut(to: "bash", arguments: ["./run.sh", "output/pumperMain.java"], at: fileManager.currentDirectoryPath)
        } catch let error {
            logger.error("Failed to run the pumper due to error:\n\(error)")
            return false
        }

        return true
    }

}