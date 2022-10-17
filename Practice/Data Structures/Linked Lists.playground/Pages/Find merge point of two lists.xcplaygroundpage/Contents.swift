import Foundation
import XCTest

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?
    
    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?
    
    public init() {}
    
    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }
    
    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }
        
        tail = node
    }
}

/// Ref: https://www.hackerrank.com/challenges/find-the-merge-point-of-two-joined-linked-lists/problem
func findMergeNode(head1: SinglyLinkedListNode?, head2: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    var end1 = head1
    var end2 = head2
    
    var isFirstList = true
    var currentNode = end1
    
    while end1 != nil && end2 != nil {
        while currentNode != nil {
            if currentNode === node2 {
                return currentNode
            }
            
            currentNode = currentNode?.next;
        }
        
        
        
    }
    
    
    return nil
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCaseBase(input: [Int], expected: [Int?]) {
        let testCaseCount = input.first!
        
        var currentIndex = 1
        func readInt() -> Int {
            let result = input[currentIndex]
            currentIndex += 1
            return result
        }
        
        func readList() -> SinglyLinkedListNode? {
            let count = readInt()
            let linkedList = SinglyLinkedList()
            for _ in 1...count {
                let num = readInt()
                linkedList.insertNode(nodeData: num)
            }
            
            return linkedList.head
        }
        
        for testIndex in 1...testCaseCount {
            let head1 = readList()
            let head2 = readList()
            
            
            let result = findMergeNode(head1: head1, head2: head2)
            
            XCTAssertTrue(result?.data == expected[testIndex - 1])
        }
    }
    
    
    
    func testCase0() {
        testCaseBase(input: [
            1,
            3,
            1, 2, 3,
            3,
            1, 2, 3
        ], expected: [2])
    }
    
    func testCase1() {
        testCaseBase(input: [
            1,
            3,
            1, 2, 3,
            2,
            1, 3
        ], expected: [3])
    }
    
//    func testCase2() {
//        testCaseBase(input: [
//            5,
//            -1,
//            21,
//            5, 6, 8, 1, 6, 8, 2, 5, 5, 7,
//            5, 7, 1, 4, 1, 5, 10, 1, 2, 2, 5,
//            -1,
//            85,
//            9, 9, 9, 5, 1, 3, 10, 7, 8, 9,
//            8, 5, 7, 9, 1, 3, 6, 5, 9, 6,
//            10, 1, 10, 9, 4, 4, 1, 8, 8, 8,
//            6, 7, 7, 4, 1, 7, 8, 3, 6, 8,
//            3, 3, 2, 1, 1, 3, 3, 8, 9, 3,
//            3, 9, 6, 5, 9, 9, 8, 1, 6, 7,
//            9, 3, 5, 7, 6, 6, 5, 6, 10, 10,
//            3, 2, 2, 6, 5, 5, 10, 7, 2, 1,
//            2, 7, 1, 7, 3,
//            -1,
//            59,
//            10, 10, 8, 10, 5, 3, 6, 2, 10, 10,
//            7, 9, 10, 1, 2, 3, 9, 6, 7, 8,
//            5, 1, 8, 6, 9, 10, 4, 1, 9, 8,
//            2, 10, 9, 9, 9, 3, 1, 4, 5, 10,
//            3, 3, 10, 4, 4, 4, 7, 2, 1, 5,
//            1, 5, 5, 1, 2, 3, 10, 7, 5,
//            -1,
//            20,
//            9, 3, 5, 9, 7, 7, 2, 3, 9, 7,
//            6, 8, 2, 1, 3, 8, 2, 4, 5, 4,
//            -1,
//            30,
//            4, 4, 6, 10, 8, 7, 4, 6, 6, 8,
//            10, 4, 6, 8, 8, 9, 6, 4, 4, 6,
//            7, 4, 8, 5, 7, 1, 1, 2, 1, 9,
//        ], expected: [0, 0, 0, 0, 0])
//    }
}

UserManagerTests.defaultTestSuite.run()
