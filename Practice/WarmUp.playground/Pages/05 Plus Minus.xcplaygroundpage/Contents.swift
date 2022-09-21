import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/plus-minus/problem
func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    var numberOfNegative: Double = 0
    var numberOfPositive: Double = 0
    var numberOfZero: Double = 0
    
    for number in arr {
        if number < 0 {
            numberOfNegative += 1
        } else if number > 0 {
            numberOfPositive += 1
        } else {
            numberOfZero += 1
        }
    }
    
    print(String(format: "%.6f", (numberOfPositive / Double(arr.count))))
    print(String(format: "%.6f", (numberOfNegative / Double(arr.count))))
    print(String(format: "%.6f", (numberOfZero / Double(arr.count))))
}

extension Double {
    func digits(num: Int) -> Double {
        var weight = pow(10, Double(num))
        return Double(Int(self * weight)) / weight
    }
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        plusMinus(arr: [1, 1, 0, -1, -1])
    }
}

UserManagerTests.defaultTestSuite.run()
