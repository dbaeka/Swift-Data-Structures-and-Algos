import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 2

extension SinglyLinkedList {
    func partition(value: T) {
        guard self.head != nil else { return }
        var newHead: Node<T>? = nil
        var headInitial: Node<T>? = nil   //The initial node of list head
        var tail: Node<T>? = nil
        var tailInitial: Node<T>? = nil   //The initial node of list tail
        var curr = self.head
           while curr != nil {
            let nextNode: Node<T>? = curr!.next // do first or order might be lost
            if curr!.getValue < value {
                if newHead == nil { // if first guy to add
                    newHead = curr // put curr as head
                    headInitial = newHead // remember that head forever
                }
                //insert curr node to head list
                newHead!.next = curr
                newHead = curr //NB: first insert points to self and is fine
             } else {
                if tail == nil { // first time adding to tail
                    tail = curr //put tail as curr
                    tailInitial = tail // remember tail head forever
                }
                // insert curr node to tail list
                tail!.next = curr // same as above
                tail = curr
             }
             curr = nextNode
           }
        newHead!.next = tailInitial  //Now, we connect the head list to tail list
        tail!.next = nil // point last guy to nil
        self.head = headInitial
    }
}


var test = SinglyLinkedList<Int>()

test.prepend(value: 20)
test.prepend(value: 30)
test.append(value: 10)
test.append(value: 20)
test.append(value: 20)
test.prepend(value: 20)
test.partition(value: 30)
print(test)
