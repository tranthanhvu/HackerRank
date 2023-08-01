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
    
    /// Ref:  https://www.hackerrank.com/challenges/tree-inorder-traversal/problem
    /// Algorithm Inorder
    /// 1. Traverse the left subtree, call inOrder (left subtree)
    /// 2 Visit root
    /// 3. Traverse the right subtree, call inOrder (right subtree)
    func inOrder(node: Node?) -> String {
        if node == nil { return "" }
        
        var result = ""
        
        let leftBranch = self.inOrder(node: node!.left)
        if !leftBranch.isEmpty {
            result = result.isEmpty ? leftBranch : "\(result) \(leftBranch)"
        }
        
        result = result.isEmpty ? "\(node!.data)" : "\(result) \(node!.data)"
        
        let rightBranch = self.inOrder(node: node!.right)
        if !rightBranch.isEmpty {
            result = result.isEmpty ? rightBranch : "\(result) \(rightBranch)"
        }
        
        return result
    }
}


class UserManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCaseBase(input: [Int], expected: String) {
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

        let result = tree.inOrder(node: root)
        print(result)
        XCTAssertTrue(result == expected)
    }
    
    func testCase0() {
        testCaseBase(input: [
            6,
            1, 2, 5, 3, 6, 4
        ], expected: "1 2 3 4 5 6")
    }
    
    func testCase1() {
        testCaseBase(input: [
            15,
            1, 14, 3, 7, 4, 5, 15, 6, 13, 10, 11, 2, 12, 8, 9
        ], expected: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15")
    }
}

UserManagerTests.defaultTestSuite.run()
