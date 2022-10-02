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

/// Ref: https://www.hackerrank.com/challenges/merge-two-sorted-linked-lists/problem
func mergeLists(llist1: SinglyLinkedListNode?, llist2: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    var currentNode1 = llist1
    var currentNode2 = llist2
    
    let resultList = SinglyLinkedList()
    
    while currentNode1 != nil || currentNode2 != nil {
        if currentNode1 != nil && currentNode2 != nil {
            if currentNode1!.data <= currentNode2!.data {
                resultList.insertNode(nodeData: currentNode1!.data)
                currentNode1 = currentNode1!.next
            } else {
                resultList.insertNode(nodeData: currentNode2!.data)
                currentNode2 = currentNode2!.next
            }
        } else if currentNode1 != nil {
            if resultList.tail != nil {
                resultList.tail?.next = currentNode1
            } else {
                resultList.head = currentNode1
            }
            break
        } else {
            if resultList.tail != nil {
                resultList.tail?.next = currentNode2
            } else {
                resultList.head = currentNode2
            }
            break
        }
    }
    
    return resultList.head
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func base(list1: [Int], list2: [Int], expected: [Int]) {
        let linkedList1 = SinglyLinkedList()
        for num in list1 {
            linkedList1.insertNode(nodeData: num);
        }
        
        let linkedList2 = SinglyLinkedList()
        for num in list2 {
            linkedList2.insertNode(nodeData: num);
        }
        
        let mergedHead = mergeLists(llist1: linkedList1.head, llist2: linkedList2.head)
        
        var result: [Int] = []
        var currentNode = mergedHead
        while currentNode != nil {
            result.append(currentNode!.data)
            currentNode = currentNode!.next
        }
            
        XCTAssertTrue(result == expected)
    }
    
    func test() {
        base(list1: [1, 3, 7], list2: [1, 2], expected: [1, 1, 2, 3, 7])
    }

    func test2() {
        base(list1: [1], list2: [1, 2, 3, 4], expected: [1, 1, 2, 3, 4])
    }

    func testOneEmptyArray() {
        base(list1: [], list2: [1, 2], expected: [1, 2])
    }
    
    func testOneEmptyArray2() {
        base(list1: [1, 2], list2: [], expected: [1, 2])
    }
    
    func testBothEmptyArrays() {
        base(list1: [], list2: [], expected: [])
    }
}

UserManagerTests.defaultTestSuite.run()
