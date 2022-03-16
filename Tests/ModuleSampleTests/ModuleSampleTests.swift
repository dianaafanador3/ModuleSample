    import XCTest
    @testable import ModuleSample

    final class ModuleSampleTests: XCTestCase {
        func testExample() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.


            let key = try Test.addTestObject(ofName: "Maria")
            let object = Test.getObject(ofType: TestObject.self, forPrimaryKey: key)
            XCTAssertNotNil(object)
            XCTAssertEqual(object.name, "Maria")
        }
    }
