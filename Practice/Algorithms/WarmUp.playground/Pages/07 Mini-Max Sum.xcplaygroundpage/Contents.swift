import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/mini-max-sum/problem
func miniMaxSum(arr: [Int]) -> Void {
    var min: Int = arr[0]
    var max: Int = arr[0]
    var sum: Int = arr[0]
    
    for i in 1..<arr.count {
        var e = arr[i]
        sum += e;
        
        if e < min {
            min = e
        } else if e > max {
            max = e
        }
    }
    
    print("\(sum - max) \(sum - min)")
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        // expected output: 16 24
        miniMaxSum(arr: [1, 3, 5, 7, 9])
    }
    
    func test2() {
        // expected output: 10 14
        miniMaxSum(arr: [1, 2, 3, 4, 5])
    }
    
    func test3() {
        // expected output: 299 9271
        miniMaxSum(arr: [7, 69, 2, 221, 8974])
    }
}

UserManagerTests.defaultTestSuite.run()
