import UIKit
import XCTest

// ref: https://www.hackerrank.com/challenges/chocolate-feast/problem

func chocolateFeast(n: Int, c: Int, m: Int) -> Int {
    var numberBar = n / c
    var sum = numberBar
    
    while numberBar / m > 0 {
        sum += numberBar / m
        numberBar = (numberBar % m) + (numberBar / m)
    }
    
    return sum
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test0() {
        XCTAssertTrue(chocolateFeast(n: 10, c: 2, m: 5) == 6)
    }
    
    func test1() {
        XCTAssertTrue(chocolateFeast(n: 12, c: 4, m: 4) == 3)
    }
    
    func test2() {
        XCTAssertTrue(chocolateFeast(n: 6, c: 2, m: 2) == 5)
    }
}

UserManagerTests.defaultTestSuite.run()
