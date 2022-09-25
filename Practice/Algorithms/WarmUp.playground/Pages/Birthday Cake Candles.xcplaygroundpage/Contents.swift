import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/birthday-cake-candles/problem
func birthdayCakeCandles(candles: [Int]) -> Int {
    if candles.isEmpty { return 0 }
    
    var largestNumber = candles.first!
    var countNumbers: [Int: Int] = [:]
    
    for n in candles {
        if countNumbers[n] != nil {
            countNumbers[n]! += 1
        } else {
            countNumbers[n] = 1
        }
        
        if largestNumber < n {
            largestNumber = n
        }
    }
    
    return countNumbers[largestNumber]!
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(birthdayCakeCandles(candles: [3, 2, 1, 3]) == 2)
    }
}

UserManagerTests.defaultTestSuite.run()
