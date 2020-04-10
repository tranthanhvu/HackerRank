import UIKit
import XCTest

// ref: https://www.hackerrank.com/challenges/service-lane/problem
// NOTE: the original func has no width array, you need to fix it
func serviceLane(w: [Int], cases: [[Int]]) -> [Int] {
    var result = [Int]()

    for i in 0..<cases.count {
        let c = cases[i]
        
        var min = w[c[0]]
        var index = c[0] + 1
        
        while min != 1 && index <= c[1] {
            if min > w[index] {
                min = w[index]
            }
            index += 1
        }
        
        result.append(min)
    }
    
    return result
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test0() {
        XCTAssertTrue(serviceLane(w: [2, 3, 1, 2, 3, 2, 3, 3], cases: [[0, 3], [4, 6], [6, 7], [3, 5], [0, 7]]) == [1, 2, 3, 2, 1])
    }
    
    func test1() {
        XCTAssertTrue(serviceLane(w: [1, 2, 2, 2, 1], cases: [[2, 3], [1, 4], [2, 4], [2, 4], [2, 3]]) == [2, 1, 1, 1, 2])
    }
}

UserManagerTests.defaultTestSuite.run()
