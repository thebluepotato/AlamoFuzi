//
//  AlamoFuziTests.swift
//  AlamoFuziTests
//
//  Created by Jonas Zaugg on 01.10.16.
//  Copyright © 2016 Jonas Zaugg. All rights reserved.
//

import XCTest
import AlamoFuzi
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
    
    func testHTMLResponse() {
        let expectation = self.expectation(description: "Request should succeed")
        var response: DataResponse<HTMLDocument>!
        
        AF.request("https://httpbin.org").responseHTML { resp in
            response = resp
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertNoThrow(try response.result.get(), "Request for example HTML page failed with error : \(response.result.mapError{$0})")
        let html = try? response.result.get()
        XCTAssertNotNil(html, "Response result value is nil.")
        let tag = html?.firstChild(css: ".mp > h1")?.stringValue
        XCTAssertNotNil(tag, "The example HTML file does not have the expected structure.")
        XCTAssertEqual(tag, "httpbin(1): HTTP Request & Response Service", "The HTML did not have the expected content")
    }
    
    func testXMLResponse() {
        let expectation = self.expectation(description: "Request should succeed")
        var response: DataResponse<XMLDocument>!
        
        AF.request("http://www.xmlfiles.com/examples/simple.xml").responseXML { resp in
            response = resp
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertNoThrow(try response.result.get(), "Request for example XML page failed with error : \(response.result.mapError{$0})")
        let xml = try? response.result.get()
        XCTAssertNotNil(xml, "Response result value is nil.")
        let tag = xml?.firstChild(xpath: "//food/name")?.stringValue
        XCTAssertNotNil(tag, "The example XML file does not have the expected structure.")
        XCTAssertEqual(tag, "Belgian Waffles", "The XML did not have the expected content.")
    }
}
