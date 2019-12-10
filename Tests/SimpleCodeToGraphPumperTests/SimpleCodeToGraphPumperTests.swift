import XCTest
import SimpleCodeToGraphPumper

let javaCode = 
"""
interface Schema {
	void initialize();
}

/**
 * @opt attributes
 */
public class Person implements Schema {
	String Name;
	UndefinedClass test;
}

/**
* @opt inferreltype composed
 */
public class Employee extends Person {
	public Person someoneElse;
}

class Client extends Person {}

/**
 * This is a comment that you can reference from somewhere else
 * @opt shape note
 * @opt commentname
 */
class comment {}
"""

final class SimpleCodeToGraphPumperTests: XCTestCase {
    func testCanCallGrapherFromSwift() throws {

      let pumperMain = PumperMain()
      XCTAssertTrue(pumperMain.pumpOut(with: javaCode))

    }

    static var allTests = [
        ("testExample", testCanCallGrapherFromSwift),
    ]
}
