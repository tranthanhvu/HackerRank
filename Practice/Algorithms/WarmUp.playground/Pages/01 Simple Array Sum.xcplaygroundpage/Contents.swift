import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/simple-array-sum/problem

func simpleArraySum(ar: [Int]) -> Int {
    return ar.reduce(0, {sum, next in return sum + next})
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(simpleArraySum(ar: [1, 2, 3, 4, 10, 11]) == 31)
    }
}

UserManagerTests.defaultTestSuite.run()
