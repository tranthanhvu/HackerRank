import UIKit
import XCTest

// ref: https://www.hackerrank.com/challenges/lisa-workbook/problem

/// You can check out every single problem in that workbook, one by one, to see if its index is the same as
/// the page number. This solution takes O(n), n: total of problems in that workbook
/// Or you can check the page number and see if I pass the condition to be special. This solution takes O(n / k),
/// k: maximum number of problems per page.

func workbook(n: Int, k: Int, arr: [Int]) -> Int {
    var countPagesPreviousChapter = 0
    var countSpecialProblem = 0
    
    for i in 0..<arr.count {
        let pagesInChapter = Int((Float(arr[i]) / Float(k)).rounded(.up))
        for page in 1...pagesInChapter {
            let currentPage = page + countPagesPreviousChapter
            let minValue = (page - 1) * k
            let maxValue = min(page * k, arr[i])
            if currentPage > minValue && currentPage <= maxValue  {
                countSpecialProblem += 1
            }
        }
        
        countPagesPreviousChapter += pagesInChapter
    }

    return countSpecialProblem
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test0() {
        XCTAssertTrue(workbook(n: 5, k: 3, arr: [4, 2, 6, 1, 10]) == 4)
    }
}

UserManagerTests.defaultTestSuite.run()
