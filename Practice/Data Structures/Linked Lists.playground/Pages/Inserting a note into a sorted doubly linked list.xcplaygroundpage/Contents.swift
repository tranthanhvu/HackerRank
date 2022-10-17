import Foundation
import XCTest

final class DoublyLinkedListNode {
    var data: Int
    var next: DoublyLinkedListNode?
    weak var prev: DoublyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class DoublyLinkedList {
    var head: DoublyLinkedListNode?
    var tail: DoublyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: DoublyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: DoublyLinkedListNode) {
        if let tail = tail {
            tail.next = node
            node.prev = tail
        } else {
            head = node
        }

        tail = node
    }
}

func printDoublyLinkedList(head: DoublyLinkedListNode?, sep: String, fileHandle: FileHandle) {
    var node = head

    while node != nil {
        fileHandle.write(String(node!.data).data(using: .utf8)!)

        node = node!.next

        if node != nil {
            fileHandle.write(sep.data(using: .utf8)!)
        }
    }
}


/// Ref: https://www.hackerrank.com/challenges/insert-a-node-into-a-sorted-doubly-linked-list/problem
func sortedInsert(llist: DoublyLinkedListNode?, data: Int) -> DoublyLinkedListNode? {
    let newNode = DoublyLinkedListNode(nodeData: data)
    
    var node = llist
    var lastNode: DoublyLinkedListNode?
    
    while node != nil {
        if node!.data > data {
            if node!.prev == nil {
                newNode.next = node
                return newNode
            }
            
            let prevNode = node!.prev
            
            prevNode?.next = newNode
            newNode.prev = prevNode
            
            newNode.next = node
            node?.prev = newNode
            
            return llist
        }
        
        lastNode = node
        node = node?.next
    }
    
    if lastNode != nil {
        lastNode!.next = newNode
        newNode.prev = lastNode
        
        return llist
    }
    
    return newNode
}

class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCaseBase(input: [Int], expected: [[Int]]) {
        var currentIndex = 0
        func readInt() -> Int {
            let result = input[currentIndex]
            currentIndex += 1
            return result
        }
        
        func readList() -> DoublyLinkedListNode? {
            let count = readInt()
            let linkedList = DoublyLinkedList()
            for _ in 1...count {
                let num = readInt()
                linkedList.insertNode(nodeData: num)
            }
            
            return linkedList.head
        }
        
        func getList(head: DoublyLinkedListNode?) -> [Int] {
            var node = head
            var arr: [Int] = []
            while node != nil {
                arr.append(node!.data)
                
                node = node?.next
            }
            
            return arr
        }
        
        let testCaseCount = readInt()
        
        for testIndex in 1...testCaseCount {
            let head = readList()
            let data = readInt()
            
            let result = sortedInsert(llist: head, data: data)
            let arr = getList(head: result)
            
            XCTAssertTrue(arr == expected[testIndex - 1])
        }
    }
    
    func testCase0() {
        testCaseBase(input: [
            1,
            4,
            1, 3, 4, 10,
            5,
        ], expected: [[1, 3, 4, 5, 10]])
    }

    func testCase1() {
        testCaseBase(input: [
            1,
            3,
            2, 3, 4,
            1,
        ], expected: [[1, 2, 3, 4]])
    }

    func testCase2() {
        testCaseBase(input: [
            1,
            3,
            1, 2, 3,
            4,
        ], expected: [[1, 2, 3, 4]])
    }
}

UserManagerTests.defaultTestSuite.run()
