import Foundation
import XCTest

// Ref: https://www.hackerrank.com/challenges/the-time-in-words/problem
func timeInWords(h: Int, m: Int) -> String {
    func toText(number: Int) -> String {
        switch number {
        case 1: return "one"
        case 2: return "two"
        case 3: return "three"
        case 4: return "four"
        case 5: return "five"
        case 6: return "six"
        case 7: return "seven"
        case 8: return "eight"
        case 9: return "nine"
        case 10: return "ten"
        case 11: return "eleven"
        case 12: return "twelve"
        case 13: return "thirteen"
        case 14: return "fourteen"
        case 15: return "quarter"
        case 16: return "sixteen"
        case 17: return "seventeen"
        case 18: return "eighteen"
        case 19: return "nineteen"
        case 20: return "twenty"
        case 21: return "twenty one"
        case 22: return "twenty two"
        case 23: return "twenty three"
        case 24: return "twenty four"
        case 25: return "twenty five"
        case 26: return "twenty six"
        case 27: return "twenty seven"
        case 28: return "twenty eight"
        case 29: return "twenty nine"
        case 30: return "half"
        default: return "o' clock"
        }
    }

    if m == 00 {
        return "\(toText(number: h)) o' clock"
    }
    else if m == 1 {
        return "one minute past \(toText(number: h))"
    }
    else if m == 15 || m == 30 {
        return "\(toText(number: m)) past \(toText(number: h))"
    }
    else if m == 45 {
        return "quarter to \(toText(number: h + 1))"
    }
    else if m == 59 {
        return "one minute to \(toText(number: h + 1))"
    }
    else if m < 30 {
        return "\(toText(number: m)) minutes past \(toText(number: h))"
    }
    else {
        return "\(toText(number: 60 - m)) minutes to \(toText(number: h + 1))"
    }
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test0() {
        XCTAssertTrue(timeInWords(h: 5, m: 47) == "thirteen minutes to six")
    }
    
    func test1() {
        XCTAssertTrue(timeInWords(h: 3, m: 00) == "three o' clock")
    }
    
    func test2() {
        XCTAssertTrue(timeInWords(h: 7, m: 15) == "quarter past seven")
    }
    
    func test3() {
        XCTAssertTrue(timeInWords(h: 7, m: 30) == "half past seven")
    }
    
    func test4() {
        XCTAssertTrue(timeInWords(h: 7, m: 59) == "one minute to eight")
    }
    
    func test5() {
        XCTAssertTrue(timeInWords(h: 7, m: 45) == "quarter to eight")
    }
}

UserManagerTests.defaultTestSuite.run()

