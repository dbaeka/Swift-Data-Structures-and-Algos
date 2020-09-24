import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 4

func createLinkedListsRecurse<T>(tree: TreeNode<T>) -> [DoubleLinkedList<TreeNode<T>>] {
    var result = [DoubleLinkedList<TreeNode<T>>]()
    createLLRecureseHelper(tree: tree, result: &result, level: 0)
    return result
}

func createLinkedListsBFS<T>(tree: TreeNode<T>) -> [DoubleLinkedList<TreeNode<T>>] {
    var result = [DoubleLinkedList<TreeNode<T>>]()
    var list = DoubleLinkedList<TreeNode<T>>()
    list.append(value: tree)
    
    while list.count > 0 {
        result.append(list)
        let parents = list
        list = DoubleLinkedList<TreeNode<T>>()
        var head = parents.first
        while head != nil {
            if head!.getValue.children[0] != nil {
                list.append(value: head!.getValue.children[0]!)
            }
            if head!.getValue.children[1] != nil {
                list.append(value: head!.getValue.children[1]!)
            }
            head = head!.next
        }
    }
    return result
}


func createLLRecureseHelper<T>(tree: TreeNode<T>?, result: inout [DoubleLinkedList<TreeNode<T>>], level: Int) {
   
    if tree == nil {
        return
    }
    var list: DoubleLinkedList<TreeNode<T>>?
    if result.count == level {
        list = DoubleLinkedList<TreeNode<T>>()
        result.append(list!)
    } else {
        list = result[level]
    }
    list!.append(value: tree!)
    createLLRecureseHelper(tree: tree!.children[0], result: &result, level: level + 1)
    createLLRecureseHelper(tree: tree!.children[1], result: &result, level: level + 1)
}


var test = [1, 2, 3, 4, 5, 6, 7, 9, 12]
var treeRoot = _createMinimalBST(array: test)
var result = createLinkedListsRecurse(tree: treeRoot!)
var result2 = createLinkedListsBFS(tree: treeRoot!)
print(result)
print(result2)
