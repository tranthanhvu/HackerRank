import Foundation
import XCTest

/// Ref: https://www.hackerrank.com/challenges/array-left-rotation/problem
func rotateLeft(d: Int, arr: [Int]) -> [Int] {
    let modD = d % arr.count
    let index = arr.index(arr.startIndex, offsetBy: modD)
    let startArr = Array(arr[..<index])
    let endArr = Array(arr[index..<arr.endIndex])
    
    return endArr + startArr
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(rotateLeft(d: 1, arr: [1, 2, 3, 4, 5]) == [2, 3, 4, 5, 1])
    }
    
    func test2() {
        XCTAssertTrue(rotateLeft(d: 4, arr: [1, 2, 3, 4, 5]) == [5, 1, 2, 3, 4])
    }
}

UserManagerTests.defaultTestSuite.run()
