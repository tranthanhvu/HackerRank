import UIKit
import XCTest

// ref: https://www.hackerrank.com/challenges/fair-rations/problem

/// you must change the line
/// fileHandle.write(String(result).data(using: .utf8)!)
/// to
/// if result == -1 {
///    fileHandle.write("NO".data(using: .utf8)!)
/// }
/// else {
///    fileHandle.write(String(result).data(using: .utf8)!)
/// }
/// It means If it's not possible to do this, It sould return -1
///

func fairRations(B: [Int]) -> Int {
    var loaves = B
    var sum = 0
    
    for i in stride(from: loaves.count - 1, to: 0, by: -1) {
        if loaves[i].isMultiple(of: 2) == false {
            loaves[i] += 1
            loaves[i-1] += 1
            sum += 2
        }
    }
    
    if loaves[0].isMultiple(of: 2) {
        return sum
    }
    else {
        return -1
    }
}

class UserManagerTests: XCTestCase {
    func test0() {
        XCTAssertTrue(fairRations(B: [2, 3, 4, 5, 6]) == 4)
    }
    
    func test1() {
        XCTAssertTrue(fairRations(B: [1, 2]) == -1)
    }

    func test2() {
        XCTAssertTrue(fairRations(B: [2, 2, 2, 2, 2]) == 0)
    }

    func test3() {
        XCTAssertTrue(fairRations(B: [2, 2, 2, 2, 1]) == -1)
    }
}

UserManagerTests.defaultTestSuite.run()
