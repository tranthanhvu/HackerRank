import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/a-very-big-sum/problem
func aVeryBigSum(ar: [Int]) -> Int {
    var sum = 0

    for number in ar {
        sum += number
    }

    return sum
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(aVeryBigSum(ar: [1000000001, 1000000002, 1000000003, 1000000004, 1000000005]) == 5000000015)
    }
}

UserManagerTests.defaultTestSuite.run()

