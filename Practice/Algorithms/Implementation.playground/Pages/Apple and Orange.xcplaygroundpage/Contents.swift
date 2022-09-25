import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/grading/problem
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    var aCount = 0
    var bCount = 0
    
    let sApple = s - a
    let tApple = t - a
    for n in apples {
        if n >= sApple && n <= tApple {
            aCount += 1
        }
    }
    
    let sOrange =  s - b;
    let tOrange =  t - b;
    for n in oranges {
        if n >= sOrange && n <= tOrange {
            bCount += 1
        }
    }
    print(aCount)
    print(bCount)
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        // expected values
        // 1
        // 1
        countApplesAndOranges(s: 7, t: 11, a: 5, b: 15, apples: [-2, 2, 1], oranges: [5, -6])
    }
    
    func test2() {
        // expected values
        // 1
        // 2
        countApplesAndOranges(s: 7, t: 10, a: 4, b: 12, apples: [2, 3, -4], oranges: [3, -2, -4])
    }
}

UserManagerTests.defaultTestSuite.run()
