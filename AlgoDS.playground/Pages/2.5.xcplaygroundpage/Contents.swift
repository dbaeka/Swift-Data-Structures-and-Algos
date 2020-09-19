import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 2

extension SinglyLinkedList where T: Numeric & BinaryInteger {
    func sumListReverse(with list: SinglyLinkedList<T>) -> SinglyLinkedList<T>? {
        guard self.head != nil, list.head != nil else { return nil }
        var carry = 0
        let biggerList: SinglyLinkedList = max(self, list)
        let smallerList: SinglyLinkedList = min(self, list)
        let resultList = SinglyLinkedList<T>()
        var currBig = biggerList.head
        var currSmall = smallerList.head
        
        while currBig != nil {
            let result = currBig!.getValue + (currSmall?.getValue ?? 0)
            resultList.append(value: (result%10) + T(carry))
            carry = Int(result) / 10
            currSmall = currSmall?.next
            currBig = currBig!.next
        }
        return resultList
    }
    
    private func addForwardHelper(lhs: Node<T>?, rhs: Node<T>?, carry: inout Int ) -> Node<T>? {
        if lhs == nil && rhs == nil && carry == 0  {
            return nil
        }

        var result = addForwardHelper(lhs: ((lhs != nil) ? lhs!.next : nil), rhs: ((rhs != nil) ? rhs!.next : nil), carry: &carry)

        let value = carry + ((lhs != nil) ? Int(lhs!.getValue) : 0 ) + ((rhs != nil) ? Int(rhs!.getValue) : 0);
        let newNode = Node(value: T(value % 10))
        newNode.next = result;
        result = newNode;
        carry = ( value > 9 ) ? 1 : 0;
        return result;
  }
    
    func sumListForward(with list: SinglyLinkedList<T>) -> SinglyLinkedList<T>? {
        guard self.head != nil, list.head != nil else { return nil }
        let diff = abs(self.count - list.count)
        let smallerList = min(self, list)
        for _ in 0..<diff {
            smallerList.prepend(value: T(0))
        }
        var carry = 0
        let resultList = SinglyLinkedList<T>()
        var node = addForwardHelper(lhs: self.head, rhs: list.head, carry: &carry)
        if carry != 0 {
            let newNode = Node(value: T(carry))
            newNode.next = node
            node = newNode
        }
        resultList.head = node
        return resultList
    }
}


var test = SinglyLinkedList<Int>()
var test2 = SinglyLinkedList<Int>()

test.prepend(value: 1)
test.prepend(value: 7)
test.append(value: 6)
test.append(value: 1)
test2.append(value: 9)
test2.append(value: 2)
test2.prepend(value: 5)
print(test.sumListForward(with: test2) ?? "")

