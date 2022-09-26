import Foundation
import XCTest

/// Ref: https://www.hackerrank.com/challenges/sparse-arrays/problem
func matchingStrings(stringList: [String], queries: [String]) -> [Int] {
    var hashTable: [String: Int] = [:]
    for key in queries {
        hashTable[key] = 0
    }
    
    for s in stringList {
        if (hashTable[s] != nil) {
            hashTable[s]! += 1
        }
    }
    
    return queries.map { hashTable[$0]! }
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        XCTAssertTrue(matchingStrings(stringList: ["aba", "baba", "aba", "xzxb"], queries: ["aba", "xzxb", "ab"]) == [2, 1, 0])
    }
    
    func test2() {
        XCTAssertTrue(matchingStrings(stringList: ["def", "de", "fgh"], queries: ["de", "lmn", "fgh"]) == [1, 0, 1])
    }
    
    func test3() {
        XCTAssertTrue(matchingStrings(stringList: [
            "abcde",
            "sdaklfj",
            "asdjf",
            "na",
            "basdn",
            "sdaklfj",
            "asdjf",
            "na",
            "asdjf",
            "na",
            "basdn",
            "sdaklfj",
            "asdjf",
        ], queries: [
            "abcde",
            "sdaklfj",
            "asdjf",
            "na",
            "basdn",
        ]) == [1, 3, 4, 3, 2])
    }
}

UserManagerTests.defaultTestSuite.run()
