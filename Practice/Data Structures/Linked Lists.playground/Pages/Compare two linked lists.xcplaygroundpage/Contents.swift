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

/// Ref:https://www.hackerrank.com/challenges/compare-two-linked-lists/problem
func compare_lists(llist1: SinglyLinkedListNode?, llist2: SinglyLinkedListNode?) -> Int {
    var currentNode1 = llist1
    var currentNode2 = llist2
    
    while currentNode1 != nil && currentNode2 != nil {
        if currentNode1!.data != currentNode2!.data {
            return 0
        }
        
        currentNode1 = currentNode1!.next
        currentNode2 = currentNode2!.next
    }
    
    return currentNode1 == nil && currentNode2 == nil ? 1 : 0
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testNotEqual() {
        var linkedList1 = SinglyLinkedList()
        for num in [1, 2, 3] {
            linkedList1.insertNode(nodeData: num);
        }
        
        var linkedList2 = SinglyLinkedList()
        for num in [1, 2, 3, 4] {
            linkedList2.insertNode(nodeData: num);
        }

        XCTAssertTrue(compare_lists(llist1: linkedList1.head, llist2: linkedList2.head) == 0)
    }
    
    func testEqual() {
        var linkedList1 = SinglyLinkedList()
        for num in [1, 2, 3] {
            linkedList1.insertNode(nodeData: num);
        }
        
        var linkedList2 = SinglyLinkedList()
        for num in [1, 2, 3] {
            linkedList2.insertNode(nodeData: num);
        }

        XCTAssertTrue(compare_lists(llist1: linkedList1.head, llist2: linkedList2.head) == 1)
    }
    
    func testOneOfTwoListsIsNil() {
        var linkedList1 = SinglyLinkedList()
        
        var linkedList2 = SinglyLinkedList()
        for num in [1, 2, 3] {
            linkedList2.insertNode(nodeData: num);
        }

        XCTAssertTrue(compare_lists(llist1: linkedList1.head, llist2: linkedList2.head) == 0)
    }
    
    func testBothListAreNil() {
        var linkedList1 = SinglyLinkedList()
        
        var linkedList2 = SinglyLinkedList()

        XCTAssertTrue(compare_lists(llist1: linkedList1.head, llist2: linkedList2.head) == 1)
    }
}

UserManagerTests.defaultTestSuite.run()
