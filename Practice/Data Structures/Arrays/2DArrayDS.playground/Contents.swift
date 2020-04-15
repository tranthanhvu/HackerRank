import UIKit
import XCTest

// ref: https://www.hackerrank.com/challenges/2d-array/problem

func hourglassSum(arr: [[Int]]) -> Int {
    var max = Int.min
    
    for r in 1...4 {
        for c in 1...4 {
            let sum = arr[r - 1][c - 1] + arr[r - 1][c] + arr[r - 1][c + 1] + arr[r][c] + arr[r + 1][c - 1] + arr[r + 1][c] + arr[r + 1][c + 1]
            if sum > max {
                max = sum
            }
        }
    }
    
    return max
}

class UserManagerTests: XCTestCase {
    func test0() {
        XCTAssertTrue(hourglassSum(arr: [[1, 1, 1, 0, 0, 0],
                                         [0, 1, 0, 0, 0, 0],
                                         [1, 1, 1, 0, 0, 0],
                                         [0, 0, 2, 4, 4, 0],
                                         [0, 0, 0, 2, 0, 0],
                                         [0, 0, 1, 2, 4, 0]]) == 19)
    }
    
    func test1() {
        XCTAssertTrue(hourglassSum(arr: [[30, 1, 1, 0, 0, 0],
                                         [0, 1, 0, 0, 0, 0],
                                         [1, 1, -30, 0, 0, 0],
                                         [0, 0, 2, 4, 4, 0],
                                         [0, 0, 0, 2, 0, 0],
                                         [0, 0, 1, 2, 4, 0]]) == 19)
    }
}

UserManagerTests.defaultTestSuite.run()
