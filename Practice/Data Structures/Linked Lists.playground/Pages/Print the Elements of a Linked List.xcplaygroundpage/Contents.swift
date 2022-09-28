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
func printLinkedList(head: SinglyLinkedListNode?) -> Void {
    var currentNode: SinglyLinkedListNode?
    currentNode = head
    while currentNode != nil {
        print(currentNode!.data)
        currentNode = currentNode?.next
    }
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        var linkedList = SinglyLinkedList()
        linkedList.insertNode(nodeData: 16)
        linkedList.insertNode(nodeData: 13)
        
        /// expected
        /// 16
        /// 13`
        printLinkedList(head: linkedList.head)
    }
}

UserManagerTests.defaultTestSuite.run()
