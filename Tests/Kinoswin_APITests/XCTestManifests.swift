import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Kinoswin_APITests.allTests),
    ]
}
#endif
