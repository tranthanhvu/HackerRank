import Foundation
import XCTest

// Start of Node class
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(d : Int) {
        data  = d
    }
} // End of Node class

// Start of Tree class
class Tree {
    func insert(root: Node?, data: Int) -> Node? {
        if root == nil {
            return Node(d: data)
        }
        
        if data <= (root?.data)! {
            root?.left = insert(root: root?.left, data: data)
        } else {
            root?.right = insert(root: root?.right, data: data)
        }
        
        return root
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

        for _ in 1...t {
            root = tree.insert(root: root, data: readInt())
        }

        let result = tree.getHeight(root: root)
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
}

UserManagerTests.defaultTestSuite.run()
