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

/// Ref: https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list/problem
func insertNodeAtTail(head: SinglyLinkedListNode?, data: Int) -> SinglyLinkedListNode {
    if head == nil {
        return SinglyLinkedListNode(nodeData: data)
    }
    
    var lastNode = head!
    while lastNode.next != nil {
        lastNode = lastNode.next!
    }
    
    lastNode.next = SinglyLinkedListNode(nodeData: data)
    
    return head!
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        var node = insertNodeAtTail(head: nil, data: 141)
        insertNodeAtTail(head: node, data: 302)
        insertNodeAtTail(head: node, data: 164)
        insertNodeAtTail(head: node, data: 530)
        insertNodeAtTail(head: node, data: 474)
        
        XCTAssertTrue(node.next?.next?.next?.next?.data == 474)
    }
}

UserManagerTests.defaultTestSuite.run()
