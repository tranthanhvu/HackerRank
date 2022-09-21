import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/staircase/problem
func staircase(n: Int) -> Void {
    // print n lines
    for row in 0..<n {
        var line: String = ""
        
        for col in 0..<n {
            // print # if its position is on the right of the diagonal
            if n - 1 - col <= row {
                line += "#"
            } else {
                line += " "
            }
        }
        
        print(line)
    }
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        staircase(n: 6)
    }
}

UserManagerTests.defaultTestSuite.run()
