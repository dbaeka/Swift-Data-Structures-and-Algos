
import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 2

extension SinglyLinkedList {
    func kthToLast1(index: Int) -> Node<T>? {
        let i = self.count - index
        if i < 0 {
            return nil
        }
        return self.nodeAt(index: i)
    }
    
    func kthToLast2(index: Int) -> Node<T>? {
        guard self.head != nil, index <= self.count else { return nil }
        
        var firstPointer = self.head
        var secondPointer = firstPointer
        
        var i = 0
        while firstPointer != nil && i < index {
            i+=1
            firstPointer = firstPointer!.next
        }
        while firstPointer != nil {
            firstPointer = firstPointer!.next
            secondPointer = secondPointer!.next
        }
        return secondPointer
    }
    
    private func kthToLastHelper(head: Node<T>?, index: Int, i: inout Int) -> Node<T>? {
        guard head != nil else { return nil }

        let node = kthToLastHelper(head: head!.next, index: index, i: &i)
          i += 1;
          //if we have solved problem k times from last.
        if ( i == index ) {
            return head;
        }
        return node;
    }
    
    func kthToLast3(index: Int) -> Node<T>? {
        var i = 0
        return kthToLastHelper(head: self.head, index: index, i: &i)
    }
}


var test = SinglyLinkedList<Int>()

test.prepend(value: 20)
test.prepend(value: 30)
test.append(value: 10)
test.append(value: 20)
test.append(value: 20)
test.prepend(value: 20)
print(test.kthToLast1(index: 7)?.getValue)
print(test.kthToLast2(index: 7)?.getValue)
print(test.kthToLast3(index: 7)?.getValue)

