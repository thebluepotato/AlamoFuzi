import XCTest
@testable import AlamoFuzi
import Alamofire
import Fuzi

class AlamoFuziTests: XCTestCase {
    let timeout: TimeInterval = 30.0
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHTMLResponse() throws {
        let expectation = self.expectation(description: "Request should succeed")
        var response: AFDataResponse<HTMLDocument>!
        
        AF.request("http://example.org").responseHTML { resp in
            response = resp
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertNil(response.error, "Request for example HTML page failed with error: \(response.error!)")
        
        #if swift(>=5.1) // For XCTUnwrap
        let html = try XCTUnwrap(response.value, "Response result value is nil.")
        
        let tag = try XCTUnwrap(html.firstChild(css: "div > h1")?.stringValue, "The example HTML file does not have the expected structure.")
        
        XCTAssertEqual(tag, "Example Domain", "The HTML did not have the expected content")
        
        #else
        let html = response.value
        XCTAssertNotNil(html, "Response result value is nil.")
        
        let tag = html?.firstChild(css: "div > p")?.stringValue
        XCTAssertNotNil(tag, "The example HTML file does not have the expected structure.")
        
        XCTAssertEqual(tag, "This domain is established to be used for illustrative examples in documents. You may use this\n    domain in examples without prior coordination or asking for permission.", "The HTML did not have the expected content")
        #endif
    }
    
    func testXMLResponse() throws {
        let expectation = self.expectation(description: "Request should succeed")
        var response: AFDataResponse<XMLDocument>!
        AF.request("https://www.w3schools.com/xml/note.xml").responseXML { resp in
            response = resp
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertNil(response.error, "Request for example XML page failed with error: \(response.error!)")
        
        #if swift(>=5.1) // For XCTUnwrap
        let xml = try XCTUnwrap(response.value, "Response result value is nil.")
        
        let tag = try XCTUnwrap(xml.firstChild(xpath: "//note/from")?.stringValue, "The example XML file does not have the expected structure.")
        
        XCTAssertEqual(tag, "Jani", "The XML did not have the expected content")
        
        #else
        let xml = response.value
        XCTAssertNotNil(xml, "Response result value is nil.")
        
        let tag = xml?.firstChild(xpath: "//note/from")?.stringValue
        XCTAssertNotNil(tag, "The example XML file does not have the expected structure.")
        
        XCTAssertEqual(tag, "Jani", "The XML did not have the expected content")
        #endif
    }
}
