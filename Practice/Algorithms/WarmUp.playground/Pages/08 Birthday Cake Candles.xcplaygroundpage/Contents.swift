import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/birthday-cake-candles/problem
func birthdayCakeCandles(candles: [Int]) -> Int {
    // Write your code here

}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        birthdayCakeCandles(candles: [1, 3, 5, 7, 9])
    }
}

UserManagerTests.defaultTestSuite.run()
