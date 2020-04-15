import UIKit
import XCTest

// ref: https://www.hackerrank.com/challenges/flatland-space-stations/problem

func flatlandSpaceStations(n: Int, c: [Int]) -> Int {
    if n == 1 { return 0 }
    
    let sortedArr = c.sorted()
    var maxDistance = 0
    
    for i in 1..<sortedArr.count {
        let currentDistance = Int(Float(sortedArr[i] - sortedArr[i-1]) / 2.0)
        if maxDistance < currentDistance {
            maxDistance = currentDistance
        }
    }
    
    if sortedArr.first! > maxDistance {
        maxDistance = sortedArr.first!
    }
    
    if n - 1 - sortedArr.last! > maxDistance {
        maxDistance = n - 1 - sortedArr.last!
    }
    
    return maxDistance
}

class UserManagerTests: XCTestCase {
    func test0() {
        XCTAssertTrue(flatlandSpaceStations(n: 5, c: [0, 4]) == 2)
    }
    func test1() {
        XCTAssertTrue(flatlandSpaceStations(n: 6, c: [0, 1, 2, 4, 3, 5]) == 0)
    }
    
    func test2() {
        XCTAssertTrue(flatlandSpaceStations(n: 1, c: [1]) == 0)
    }
    
    func test3() {
        XCTAssertTrue(flatlandSpaceStations(n: 5, c: [3]) == 3)
    }
}

UserManagerTests.defaultTestSuite.run()
