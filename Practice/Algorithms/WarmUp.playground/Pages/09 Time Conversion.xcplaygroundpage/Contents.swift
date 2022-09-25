import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/time-conversion/problem
func timeConversion(s: String) -> String {
    var h = Int(String(s[..<s.index(s.startIndex, offsetBy: 2)])) ?? 0
    let ms = String(s[s.index(s.startIndex, offsetBy: 2)..<s.index(s.endIndex, offsetBy: -2)])
    let isAM = s.hasSuffix("AM")
    
    if isAM && h >= 12 {
        h -= 12
    } else if !isAM && h < 12 {
        h += 12
    }
    
    return String(format: "%02d%@", arguments: [h, ms])
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(timeConversion(s: "07:05:45PM") == "19:05:45")
    }
    
    func test2() {
        XCTAssertTrue(timeConversion(s: "12:01:00PM") == "12:01:00")
    }
    
    func test3() {
        XCTAssertTrue(timeConversion(s: "12:01:00AM") == "00:01:00")
    }
}

UserManagerTests.defaultTestSuite.run()
