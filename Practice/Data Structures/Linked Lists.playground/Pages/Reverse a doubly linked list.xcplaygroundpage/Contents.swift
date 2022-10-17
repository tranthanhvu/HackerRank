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


/// Ref: https://www.hackerrank.com/challenges/reverse-a-doubly-linked-list/problem
func reverse(llist: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
    var node = llist
    var lastNode: DoublyLinkedListNode?
    
    while node != nil {
        let nextNode = node!.next
        
        node!.next = node!.prev
        node!.prev = nextNode
        
        lastNode = node
        node = nextNode
    }
    
    return lastNode
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
            
            let result = reverse(llist: head)
            let arr = getList(head: result)
            
            XCTAssertTrue(arr == expected[testIndex - 1])
        }
    }
    
    func testCase0() {
        testCaseBase(input: [
            1,
            4,
            1, 2, 3, 4,
        ], expected: [[4, 3, 2, 1]])
    }
}

UserManagerTests.defaultTestSuite.run()
