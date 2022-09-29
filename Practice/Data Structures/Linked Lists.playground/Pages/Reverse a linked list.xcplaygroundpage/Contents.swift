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

/// Ref: https://www.hackerrank.com/challenges/reverse-a-linked-list/problem
func reverse(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    if llist == nil {
        return nil
    }

    var previousNode: SinglyLinkedListNode?
    var currentNode = llist
    var nextNode: SinglyLinkedListNode?
    
    while currentNode != nil {
        nextNode = currentNode?.next
        currentNode?.next = previousNode
        
        previousNode = currentNode
        currentNode = nextNode
    }
    
    return previousNode
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testReverseLinkedList() {
        var linkedList = SinglyLinkedList()
        for num in [20, 6, 2, 19, 7, 4, 15, 9] {
            linkedList.insertNode(nodeData: num);
        }
        
        let node = reverse(llist: linkedList.head)
        
        var result: [Int] = []
        var currentNode = node
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }

        XCTAssertTrue(result == [9, 15, 4, 7, 19, 2, 6, 20])
        
    }
}

UserManagerTests.defaultTestSuite.run()
