import Foundation

open class TreeNode<T: Comparable>: Comparable {

    
    public var data: T
    public var children: [TreeNode<T>?] = []
    
    public init(value: T, children: Int) {
        self.data = value
        self.children = [TreeNode<T>?](repeating: nil, count: children)
    }
    
    public static func < (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    public static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

open class BinaryTreeNode<T: Comparable>: TreeNode<T> {
    
    convenience public init(value: T) {
        self.init(value: value, children: 2)
    }
    
    public var left: BinaryTreeNode<T>? {
        return super.children[0] as? BinaryTreeNode<T>
    }
    
    public var right: BinaryTreeNode<T>? {
        return super.children[1] as? BinaryTreeNode<T>
    }
}

public func _createMinimalBST<T>(array: [T]) -> TreeNode<T>? {
    return _createMinimalBST(array: array, start: 0, end: array.count - 1)
}

func _createMinimalBST<T>(array: [T], start: Int, end: Int) -> TreeNode<T>? {
    if end < start {
        return nil
    }
    let mid = (start + end) / 2
    let n = TreeNode(value: array[mid], children: 2)
    n.children[0] = _createMinimalBST(array: array, start: start, end: mid - 1)
    n.children[1] = _createMinimalBST(array: array, start: mid + 1, end: end)
    return n
}

open class Tree<T: Comparable> {
    public var root: BinaryTreeNode<T>?
    
    public func inOrderTraversal(node: BinaryTreeNode<T>?) {
        if node != nil {
            inOrderTraversal(node: node!.left)
            //visit(node)
            inOrderTraversal(node: node!.right)
        }
    }
    
    public func preOrderTraversal(node: BinaryTreeNode<T>?) {
        if node != nil {
            //visit(node)
            preOrderTraversal(node: node!.left)
            preOrderTraversal(node: node!.right)
        }
    }
    
    public func postOrderTraversal(node: BinaryTreeNode<T>?) {
        if node != nil {
            postOrderTraversal(node: node!.left)
            postOrderTraversal(node: node!.right)
            //visit(node)
        }
    }
}


public func printBinaryTree<T>(node: TreeNode<T>?) -> String {
    guard node != nil else {
        return "nil"
    }
    let left = node!.children[0]
    let right = node!.children[1]
    let le = left == nil ? "nil" : "\(left!.data)"
    let re = right == nil ? "nil" : "\(right!.data)"
    let me = "\(node!.data), {\(le), \(re)}"
    let l = left == nil ? "" : "\n -> " + printBinaryTree(node: left)
    let r = right == nil ? "" : "\n -> " + printBinaryTree(node: right)
    return me + l + r
}
