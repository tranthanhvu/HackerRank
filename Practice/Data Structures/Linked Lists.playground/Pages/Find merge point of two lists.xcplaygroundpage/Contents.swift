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
    var node1 = head1
    var node2 = head2
    
    while node1 != nil || node2 != nil {
        if node1 != nil {
            let find1 = findMergeNode(head: head2, end: node2, checkingNode: node1!)
            if find1 != nil {
                return find1
            }
        }
        
        if node2 != nil {
            let find2 = findMergeNode(head: head1, end: node1, checkingNode: node2!)
            if find2 != nil {
                return find2
            }
        }
        
        node1 = node1?.next
        node2 = node2?.next
    }
    
    return nil
}

func findMergeNode(head: SinglyLinkedListNode?, end: SinglyLinkedListNode?, checkingNode: SinglyLinkedListNode) -> SinglyLinkedListNode? {
    var currentNode = head
    while currentNode != nil {
        if currentNode === checkingNode {
            return checkingNode
        }
        
        if currentNode === end {
            return nil
        }
        
        currentNode = currentNode?.next
    }
    
    return nil
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCaseBase(input: [Int], expected: [Int?]) {
        var currentIndex = 0
        func readInt() -> Int {
            let result = input[currentIndex]
            currentIndex += 1
            return result
        }
        
        let testCaseCount = readInt()
        
        for testIndex in 1...testCaseCount {
            let index = readInt()
            
            let count1 = readInt()
            let linkedList1 = SinglyLinkedList()
            for _ in 1...count1 {
                let num = readInt()
                linkedList1.insertNode(nodeData: num)
            }
            
            let head1 = linkedList1.head
            
            let count2 = readInt()
            let linkedList2 = SinglyLinkedList()
            for _ in 1...count2 {
                let num = readInt()
                linkedList2.insertNode(nodeData: num)
            }
            
            let head2 = linkedList2.head
            
            var ptr1 = head1
            var ptr2 = head2
            
            for i in 0..<count1 {
                if i < index {
                    ptr1 = ptr1?.next
                }
            }
            
            for i in 0..<count2 {
                if i != count2 - 1 {
                    ptr2 = ptr2?.next
                }
            }
            
            ptr2?.next = ptr1
            
            let result = findMergeNode(head1: head1, head2: head2)
            
            XCTAssertTrue(result?.data == expected[testIndex - 1])
        }
    }
    
    func testCasePre0() {
        testCaseBase(input: [
            1,
            1,
            3,
            1, 2, 3,
            3,
            1, 2, 3
        ], expected: [2])
    }
    
    func testCasePre1() {
        testCaseBase(input: [
            1,
            2,
            3,
            1, 2, 3,
            2,
            1, 3
        ], expected: [3])
    }
    
    func testCase0() {
        testCaseBase(input: [
            1,
            1,
            3,
            1, 2, 3,
            1,
            1
        ], expected: [2])
    }
    
    func testCase1() {
        testCaseBase(input: [
            1,
            2,
            3,
            1, 2, 3,
            1,
            1,
        ], expected: [3])
    }
}

UserManagerTests.defaultTestSuite.run()
