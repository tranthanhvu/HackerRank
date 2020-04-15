import UIKit
import XCTest

// ref: https://www.hackerrank.com/challenges/arrays-ds/problem

func reverseArray(a: [Int]) -> [Int] {
    var newArr: [Int] = []
    
    for i in stride(from: a.count - 1, to: -1, by: -1) {
        newArr.append(a[i])
    }
    
    return newArr
}

class UserManagerTests: XCTestCase {
    func test0() {
        let arr = [1, 4, 3, 2]
        XCTAssertTrue(reverseArray(a: arr) == arr.reversed())
    }
}

UserManagerTests.defaultTestSuite.run()
