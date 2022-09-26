import Foundation
import XCTest

/// Ref: https://www.hackerrank.com/challenges/dynamic-array/problem
/// For example:
/// - [1, 0, 5]: use the first query type, x is qual to 0, and append 5 to the arr[y]
/// - [2, 1, 1]: use the second query type, x is equal to 1, and y equal to 1, rememeber to add the last answer for this type
func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    var arr: [[Int]] = Array(repeating: [Int](), count: n)
    var lastAnswer: Int = 0
    var result: [Int] = []
    
    for query in queries {
        if (query[0] == 1) {
            let idx = indexOf(x: query[1], lastAnswer: lastAnswer, n: n)
            arr[idx].append(query[2])
        } else if (query[0] == 2) {
            let idx = indexOf(x: query[1], lastAnswer: lastAnswer, n: n)
            lastAnswer = arr[idx][query[2] % arr[idx].count]
            result.append(lastAnswer)
        }
    }
    
    return result
}

func indexOf(x: Int, lastAnswer: Int, n: Int) -> Int {
    return (x ^ lastAnswer) % n
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        let queries = [
            [1, 0, 5],
            [1, 1, 7],
            [1, 0, 3],
            [2, 1, 0],
            [2, 1, 1]
        ]
        
        XCTAssertTrue(dynamicArray(n: 2, queries: queries) == [7, 3])
    }
}

UserManagerTests.defaultTestSuite.run()
