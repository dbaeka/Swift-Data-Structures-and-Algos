import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 4

func createMinimalBST<T>(array: [T]) -> TreeNode<T>? {
    return createMinimalBST(array: array, start: 0, end: array.count - 1)
}

func createMinimalBST<T>(array: [T], start: Int, end: Int) -> TreeNode<T>? {
    if end < start {
        return nil
    }
    let mid = (start + end) / 2
    let n = TreeNode(value: array[mid], children: 2)
    n.children[0] = createMinimalBST(array: array, start: start, end: mid - 1)
    n.children[1] = createMinimalBST(array: array, start: mid + 1, end: end)
    return n
}

var test = [1, 2, 3, 4, 5, 6, 7, 9, 12]
var treeRoot = createMinimalBST(array: test)
print(printBinaryTree(node: treeRoot))
