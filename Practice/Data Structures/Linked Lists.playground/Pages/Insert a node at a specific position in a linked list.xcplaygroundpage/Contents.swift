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

/// Ref: https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list/problem
func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    var newNode = SinglyLinkedListNode(nodeData: data)
    
    if llist == nil {
        return newNode
    }
    
    var currentNode = llist
    var currentPosition = 0
    
    while currentPosition < position - 1 && currentNode!.next != nil {
        currentPosition += 1
        currentNode = currentNode!.next
    }
    
    newNode.next = currentNode?.next
    currentNode?.next = newNode
    
    return llist
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test1() {
        var linkedList = SinglyLinkedList()
        for num in [16, 13, 7] {
            linkedList.insertNode(nodeData: num);
        }
        
        var node = insertNodeAtPosition(llist: linkedList.head, data: 1, position: 2)

        var result: [Int] = []
        var currentNode = node
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }

        XCTAssertTrue(result == [16, 13, 1, 7])
    }
}

UserManagerTests.defaultTestSuite.run()
