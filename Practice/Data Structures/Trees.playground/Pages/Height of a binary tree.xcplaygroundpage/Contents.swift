import Foundation
import XCTest

/// Firstly, let implementing the Node element
class Node {
    // its data
    var data: Int
    
    // left child linked to a left node
    var left: Node?
    
    // right child linked to a right node
    var right: Node?
    
    // we're going to pass a data to its contruction
    init(d : Int) {
        data  = d
    }
}

/// Secondly, let implementing the Tree class
class Tree {
    /// this function is to insert a new node with its data to a specific node
    func insert(node: Node?, data: Int) -> Node? {
        // node is nil when its parent is a leaf
        // we're going to create a new node in this case
        if node == nil {
            return Node(d: data)
        }
        
        // otherwise, try to insert to left or right branch
        if data <= node!.data {
            node!.left = insert(node: node!.left, data: data)
        } else {
            node!.right = insert(node: node!.right, data: data)
        }
        
        return node
    }
    
    // Ref: https://www.hackerrank.com/challenges/tree-height-of-a-binary-tree/problem
    func getHeight(root: Node?) -> Int {
        let height = getNodeLength(root: root)
        
        return max(0, height - 1)
    }
    
    func getNodeLength(root: Node?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftHeight = self.getNodeLength(root: root!.left)
        let rightHeight = self.getNodeLength(root: root!.right)
        
        return leftHeight > rightHeight ? leftHeight + 1 : rightHeight + 1
    }
} // End of Tree class


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCaseBase(input: [Int], expected: Int) {
        var currentIndex = 0
        func readInt() -> Int {
            let result = input[currentIndex]
            currentIndex += 1
            return result
        }
        
        var root: Node?
        let tree = Tree()
        let t = readInt()

        for _ in 0..<t {
            root = tree.insert(node: root, data: readInt())
        }

        let result = tree.getHeight(root: root)
        print(result)
        XCTAssertTrue(result == expected)
    }
    
    func testCase0() {
        testCaseBase(input: [
            7,
            3, 5, 2, 1, 4, 6, 7
        ], expected: 3)
    }
    
    func testCase1() {
        testCaseBase(input: [
            7,
            4, 2, 6, 1, 3, 5, 7
        ], expected: 2)
    }

    func testCase2() {
        testCaseBase(input: [
            5,
            3, 1, 7, 5, 4
        ], expected: 3)
    }
    
    func testCase3() {
        testCaseBase(input: [
            1,
            15
        ], expected: 0)
    }
}

UserManagerTests.defaultTestSuite.run()
