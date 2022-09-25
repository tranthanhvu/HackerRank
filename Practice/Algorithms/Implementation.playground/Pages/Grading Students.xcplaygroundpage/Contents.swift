import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/grading/problem
func gradingStudents(grades: [Int]) -> [Int] {
    var finalGrades: [Int] = []
    
    for n in grades {
        if n < 38 {
            finalGrades.append(n)
        } else if n % 5 >= 3 {
            finalGrades.append(n + (5 - n % 5))
        } else {
            finalGrades.append(n)
        }
    }
    
    return finalGrades
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(gradingStudents(grades: [73, 67, 38, 33]) == [75, 67, 40, 33])
    }
}

UserManagerTests.defaultTestSuite.run()
