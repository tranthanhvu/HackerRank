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

/// Ref: https://www.hackerrank.com/challenges/delete-duplicate-value-nodes-from-a-sorted-linked-list/problem
func removeDuplicates(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    if llist == nil { return nil }
    var currentNode = llist
    var nextNode = llist?.next
    
    while nextNode != nil {
        if currentNode!.data == nextNode!.data {
            currentNode?.next = nextNode?.next
            
            nextNode = nextNode?.next
        } else {
            currentNode = nextNode
            nextNode = nextNode?.next
        }
    }
    
    return llist
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func base(list: [Int], expected: [Int]) {
        let linkedList = SinglyLinkedList()
        for num in list {
            linkedList.insertNode(nodeData: num);
        }
        
        let revisedList = removeDuplicates(llist: linkedList.head)
        var result: [Int] = []
        var currentNode: SinglyLinkedListNode? = revisedList
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode?.next
        }
        
        XCTAssertTrue(result == expected)
    }
    
    func test() {
        base(list: [1, 2, 2, 3, 3, 3, 3], expected: [1, 2, 3])
    }
    
    func testNil() {
        base(list: [], expected: [])
    }
}

UserManagerTests.defaultTestSuite.run()
