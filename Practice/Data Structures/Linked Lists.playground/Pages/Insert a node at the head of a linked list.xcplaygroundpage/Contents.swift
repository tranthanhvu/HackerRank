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

/// Ref: https://www.hackerrank.com/challenges/insert-a-node-at-the-head-of-a-linked-list/problem
func insertNodeAtHead(head: SinglyLinkedListNode?, data: Int) -> SinglyLinkedListNode {
    if head == nil {
        return SinglyLinkedListNode(nodeData: data)
    }
    
    let newHead = SinglyLinkedListNode(nodeData: data)
    newHead.next = head

    return newHead
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testInsertANodeAtTheHead() {
        var head: SinglyLinkedListNode?
        for num in [383, 484, 392, 975, 321] {
            head = insertNodeAtHead(head: head, data: num)
        }
        
        XCTAssertTrue(head!.data == 321)
    }
}

UserManagerTests.defaultTestSuite.run()
