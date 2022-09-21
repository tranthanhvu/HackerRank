import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/compare-the-triplets/problem

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var aScore = 0
    var bScore = 0

    for i in 0..<a.count {
        if a[i] < b[i] {
            bScore += 1
        } else if a[i] > b[i] {
            aScore += 1
        }
    }

    return [aScore, bScore]
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(compareTriplets(a: [5, 6, 7], b: [3, 6, 10]) == [1, 1])
    }
    
    func test2() {
        XCTAssertTrue(compareTriplets(a: [17, 28, 30], b: [99, 16, 8]) == [2, 1])
    }
}

UserManagerTests.defaultTestSuite.run()
