import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/diagonal-difference/problem
func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var leftToRight = 0
    var rightToLeft = 0
    for i in 0..<arr.count {
        leftToRight += arr[i][i]
        rightToLeft += arr[arr.count - 1 - i][i]
    }

    return abs(leftToRight - rightToLeft)
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(diagonalDifference(arr: [[11, 2, 4], [4, 5, 6], [10, 8, -12]]) == 15)
    }
}

UserManagerTests.defaultTestSuite.run()

