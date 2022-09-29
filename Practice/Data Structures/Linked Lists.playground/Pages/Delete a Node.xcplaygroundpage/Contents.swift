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

/// Ref: https://www.hackerrank.com/challenges/delete-a-node-from-a-linked-list/problem
func deleteNode(llist: SinglyLinkedListNode?, position: Int) -> SinglyLinkedListNode? {
    if llist == nil {
        return llist
    }
    
    if position == 0 {
        return llist?.next
    } else {
        var currentPosition = 0
        var currentNode: SinglyLinkedListNode? = llist
        
        while currentPosition < position - 1 && currentNode != nil {
            currentPosition += 1
            currentNode = currentNode!.next
        }
        
        currentNode?.next = currentNode?.next?.next
    }
    
    return llist
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testRemoveANodeInALinkedList() {
        var linkedList = SinglyLinkedList()
        for num in [20, 6, 2, 19, 7, 4, 15, 9] {
            linkedList.insertNode(nodeData: num);
        }
        
        var node = deleteNode(llist: linkedList.head, position: 3)

        var result: [Int] = []
        var currentNode = node
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }

        XCTAssertTrue(result == [20, 6, 2, 7, 4, 15, 9])
    }
    
    func testRemoveTheOutOfRangeNode() {
        var linkedList = SinglyLinkedList()
        for num in [20, 6, 2, 19, 7, 4, 15, 9] {
            linkedList.insertNode(nodeData: num);
        }
        
        var node = deleteNode(llist: linkedList.head, position: 9)

        var result: [Int] = []
        var currentNode = node
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }

        XCTAssertTrue(result == [20, 6, 2, 19, 7, 4, 15, 9])
    }
    
    func testRemoveTheLastNode() {
        var linkedList = SinglyLinkedList()
        for num in [20, 6, 2, 19, 7, 4, 15, 9] {
            linkedList.insertNode(nodeData: num);
        }
        
        var node = deleteNode(llist: linkedList.head, position: 7)

        var result: [Int] = []
        var currentNode = node
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }

        XCTAssertTrue(result == [20, 6, 2, 19, 7, 4, 15])
    }
    
    func testEmptyElement() {
        var linkedList = SinglyLinkedList()
        
        var node = deleteNode(llist: linkedList.head, position: 3)

        var result: [Int] = []
        var currentNode = node
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }

        XCTAssertTrue(result == [])
    }

    func testRemoveTheFirstNode() {
        var linkedList = SinglyLinkedList()
        for num in [20, 6, 2, 19, 7, 4, 15, 9] {
            linkedList.insertNode(nodeData: num);
        }
        
        var node = deleteNode(llist: linkedList.head, position: 0)

        var result: [Int] = []
        var currentNode = node
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }

        XCTAssertTrue(result == [6, 2, 19, 7, 4, 15, 9])
    }
}

UserManagerTests.defaultTestSuite.run()
