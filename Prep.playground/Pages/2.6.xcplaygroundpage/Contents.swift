import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 2

extension SinglyLinkedList {
    func isPalindrome() -> Bool {
        guard self.head != nil else { return false }
        
        return permutationHelper(left: &self.head, right: self.head)
    }
    
    private func permutationHelper(left: inout Node<T>?, right: Node<T>?) -> Bool {
        if right == nil {
            return true
        }
        //push right to the end
        var isPalindrome = permutationHelper(left: &left, right: right!.next)
        
        if !isPalindrome {
            return false
        }

        // check values at current node.
        isPalindrome = left!.getValue == right!.getValue

        // move left to next for next call.
        left = left!.next

        return isPalindrome
  }
}


var test = SinglyLinkedList<Int>()

test.prepend(value: 1)
test.prepend(value: 7)
test.append(value: 7)
test.append(value: 1)
test.prepend(value: 1)
test.append(value: 2)
test.prepend(value: 2)
print(test.isPalindrome())

