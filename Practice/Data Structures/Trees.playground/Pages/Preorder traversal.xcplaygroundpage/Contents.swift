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
    /// this is the root node of the tree
    /// it's not nil because of the problem's contraints ( 1 <= nodes in the tree <= 500)
    let root: Node
    
    // to initial the tree, we're going to pass into it a data to root node
    init(d: Int) {
        root = Node(d: d)
    }
    
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
    
    
    /// Ref: https://www.hackerrank.com/challenges/tree-preorder-traversal/problem
    /// Algorithm Preorder
    ///  1. Visit root
    ///  2.Traverse the left subtree, call preOrder (left subtree)
    ///  3. Traverse the right subtree, call preOrder (right subtree)
    func preOrder(node: Node?) -> String {
        if node == nil { return "" }
        
        var result = "\(node!.data)"
        
        let leftBranch = self.preOrder(node: node!.left)
        if !leftBranch.isEmpty {
            result += " " + leftBranch
        }
        
        let rightBranch = self.preOrder(node: node!.right)
        if !rightBranch.isEmpty {
            result += " " + rightBranch
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
        
        let t = readInt()
        let rootData = readInt()
        let tree = Tree(d: rootData)
        
        for _ in 1..<t {
            tree.insert(node: tree.root, data: readInt())
        }
        
        let result = tree.preOrder(node: tree.root)
        print(result)
        XCTAssertTrue(result == expected)
    }
    
    func testCase0() {
        testCaseBase(input: [
            6,
            1, 2, 5, 3, 6, 4
        ], expected: "1 2 5 3 4 6")
    }
    
    func testCase1() {
        testCaseBase(input: [
            15,
            1, 14, 3, 7, 4, 5, 15, 6, 13, 10, 11, 2, 12, 8, 9
        ], expected: "1 14 3 2 7 4 5 6 13 10 8 9 11 12 15")
    }
}

UserManagerTests.defaultTestSuite.run()
