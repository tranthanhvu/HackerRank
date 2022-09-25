import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/diagonal-difference/problem
func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var sumPrimaryDiagonal = 0, sumSecondaryDiagonal = 0
    
    // O(n)
    for i in 0..<arr.count {
        sumPrimaryDiagonal += arr[i][i]
        sumSecondaryDiagonal += arr[0 + i][arr.count - 1 - i]
    }
    
    return abs(sumPrimaryDiagonal - sumSecondaryDiagonal)
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
