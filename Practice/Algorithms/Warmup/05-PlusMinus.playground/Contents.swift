import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/plus-minus/problem
func plusMinus(arr: [Int]) -> Void {
    var countPositive: Float = 0
    var countNegative: Float = 0

    for number in arr {
        if (number > 0) {
            countPositive += 1
        } else if (number < 0) {
            countNegative += 1
        }
    }

    
    print(countPositive / (Float)(arr.count))
    print(countNegative / (Float)(arr.count))
    print(((Float)(arr.count) - countPositive - countNegative) / (Float)(arr.count))
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test0() {
        plusMinus(arr: [-4, 3, -9, 0, 4, 1])
    }
}

UserManagerTests.defaultTestSuite.run()
