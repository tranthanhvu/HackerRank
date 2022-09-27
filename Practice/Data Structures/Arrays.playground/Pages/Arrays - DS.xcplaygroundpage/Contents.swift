import Foundation
import XCTest

/// Ref: https://www.hackerrank.com/challenges/arrays-ds/problem
func reverseArray(a: [Int]) -> [Int] {
    var arr: [Int] = []
    
    for i in 0..<a.count {
        arr.append(a[a.count - 1 - i])
    }
    
    return arr
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(reverseArray(a: [1, 4, 3, 2]) == [2, 3, 4, 1])
    }
}

UserManagerTests.defaultTestSuite.run()
