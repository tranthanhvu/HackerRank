import Foundation
import XCTest

/// Ref: https://www.hackerrank.com/challenges/2d-array/problem
func hourglassSum(arr: [[Int]]) -> Int {
    var max: Int?
    for r in 1..<arr.count - 1 {
        for c in 1..<arr[r].count - 1 {
            let sum = arr[r - 1][c - 1] + arr[r - 1][c] + arr[r - 1][c + 1] +
                                          arr[r][c] +
                      arr[r + 1][c - 1] + arr[r + 1][c] + arr[r + 1][c + 1]
            
            if max == nil {
                max = sum
            } else if sum > max! {
                max! = sum
            }
        }
    }
    
    return max!
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(hourglassSum(arr: [
            [-9, -9, -9, 1, 1, 1],
            [0, -9, 0, 4, 3, 2],
            [-9, -9, -9, 1, 2, 3],
            [0, 0, 8, 6, 6, 0],
            [0, 0, 0, -2, 0, 0],
            [0, 0, 1, 2, 4, 0],
        ]) == 28)
    }
    
    func test2() {
        XCTAssertTrue(hourglassSum(arr: [
            [1, 1, 1, 0, 0, 0],
            [0, 1, 0, 0, 0, 0],
            [1, 1, 1, 0, 0, 0],
            [0, 0, 2, 4, 4, 0],
            [0, 0, 0, 2, 0, 0],
            [0, 0, 1, 2, 4, 0],
        ]) == 19)
    }
}

UserManagerTests.defaultTestSuite.run()
