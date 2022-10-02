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

/// Ref: https://www.hackerrank.com/challenges/get-the-value-of-the-node-at-a-specific-position-from-the-tail/problem
func getNode(llist: SinglyLinkedListNode?, positionFromTail: Int) -> Int {
    assert(llist != nil)
    
    var start = llist
    var end = llist

    var currentIndex = positionFromTail
    while currentIndex >= 0 {
        if end == nil {
            assertionFailure("out of range")
        }
        
        end = end?.next
        currentIndex -= 1
    }
    
    while end != nil {
        start = start?.next
        end = end?.next
    }
    
    return start!.data
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func base(list: [Int], positionFromTail: Int, expected: Int) {
        let linkedList = SinglyLinkedList()
        for num in list {
            linkedList.insertNode(nodeData: num);
        }
        
        let result = getNode(llist: linkedList.head, positionFromTail: positionFromTail)
            
        XCTAssertTrue(result == expected)
    }
    
    func test() {
        base(list: [3, 2, 1, 0], positionFromTail: 2, expected: 2)
    }
}

UserManagerTests.defaultTestSuite.run()
