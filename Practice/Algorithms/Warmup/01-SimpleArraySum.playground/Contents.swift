import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/simple-array-sum/problem

func simpleArraySum(ar: [Int]) -> Int {
    var sum = 0;

    for number in ar {
        sum += number;
    }
    
    return sum;
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test() {
        XCTAssertTrue(simpleArraySum(ar: [1, 2, 3, 4, 10, 11]) == 31)
    }
}

UserManagerTests.defaultTestSuite.run()

