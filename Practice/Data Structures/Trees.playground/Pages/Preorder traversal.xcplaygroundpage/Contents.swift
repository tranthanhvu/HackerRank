import Foundation
import XCTest

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(d : Int) {
        data  = d
    }
}

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
    
    // Ref: https://www.hackerrank.com/challenges/tree-preorder-traversal/problem
    func preOrder(root: Node?) -> String {
        if root == nil { return "" }
        
        var result = "\(root!.data)"
        
        let leftBranch = self.preOrder(root: root!.left)
        if !leftBranch.isEmpty {
            result += " " + leftBranch
        }
        
        let rightBranch = self.preOrder(root: root!.right)
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
        
        var root: Node?
        let tree = Tree()

        let t = readInt()

        for _ in 1...t {
            root = tree.insert(root: root, data: readInt())
        }

        let result = tree.preOrder(root: root)

        XCTAssertTrue(result == expected)
    }
    
    func testCase0() {
        testCaseBase(input: [
            6,
            1, 2, 5, 3, 6, 4
        ], expected: "1 2 5 3 4 6")
    }
}

UserManagerTests.defaultTestSuite.run()
