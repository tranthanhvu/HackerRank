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

/// Ref: https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list-in-reverse/problem
func reversePrint(llist: SinglyLinkedListNode?) -> Void {
    if llist == nil {
        return
    }

    var result: String = "\(llist!.data)"
    
    var currentNode = llist
    while currentNode?.next != nil {
        currentNode = currentNode?.next
        result = "\(currentNode!.data)\n" + result
    }
    
    print(result)
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testReversePrint() {
        var linkedList = SinglyLinkedList()
        for num in [20, 6, 2, 19, 7, 4, 15, 9] {
            linkedList.insertNode(nodeData: num);
        }
        
        /// expected data
        /// 9
        /// 15
        /// 4
        /// 7
        /// 19
        /// 2
        /// 6
        /// 20
        reversePrint(llist: linkedList.head)
    }
}

UserManagerTests.defaultTestSuite.run()
