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
    
    /// Ref: https://www.hackerrank.com/challenges/tree-postorder-traversal/problem
    /// Algorithm Postorder
    /// 1. Traverse the left subtree, call postOrder (left subtree)
    /// 2. Traversa the right subtree, call postOrder (right subtree)
    /// 3. Visit root
    func postOrder(node: Node?) -> String {
        if node == nil { return "" }
        
        var result = ""
        
        let leftBranch = self.postOrder(node: node!.left)
        if !leftBranch.isEmpty {
            result = result.isEmpty ? leftBranch : "\(result) \(leftBranch)"
        }
        
        let rightBranch = self.postOrder(node: node!.right)
        if !rightBranch.isEmpty {
            result = result.isEmpty ? rightBranch : "\(result) \(rightBranch)"
        }
        
        result = result.isEmpty ? "\(node!.data)" : "\(result) \(node!.data)"
        
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

        let result = tree.postOrder(node: tree.root)
        print(result)
        XCTAssertTrue(result == expected)
    }
    
    func testCase0() {
        testCaseBase(input: [
            6,
            1, 2, 5, 3, 6, 4
        ], expected: "4 3 6 5 2 1")
    }
    
    func testCase1() {
        testCaseBase(input: [
            15,
            1, 14, 3, 7, 4, 5, 15, 6, 13, 10, 11, 2, 12, 8, 9,
        ], expected: "2 6 5 4 9 8 12 11 10 13 7 3 15 14 1")
    }
}

UserManagerTests.defaultTestSuite.run()
