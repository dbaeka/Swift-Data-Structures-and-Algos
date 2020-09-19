import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 2

extension SinglyLinkedList {
    func isIntersection(with list: SinglyLinkedList<T>) -> Node<T>? {
        guard self.head != nil, list.head != nil else { return nil }
        
        var bigNode = max(self, list).head
        var smallNode = min(self, list).head
        
        var i = 0
        
        while i < abs(self.count - list.count) && bigNode != nil {
            bigNode = bigNode!.next;
            i += 1;
        }
          
        //Now we have equal nodes to travel on both the nodes
        // traversing and comparing the pointers.

        while bigNode != nil && smallNode != nil {
            if bigNode === smallNode {
              return bigNode;
            }
            bigNode = bigNode!.next;
            smallNode = smallNode!.next;
        }
        
        return nil
    }
}


var test = SinglyLinkedList<Int>()
var test2 = SinglyLinkedList<Int>()

var node = Node(value: 8)
test.head = node
test.prepend(value: 1)
test.prepend(value: 7)
test.append(value: 6)
test.append(value: 1)

test2.head = node
test2.prepend(value: 5)

test
test2
print(test.isIntersection(with: test2)?.getValue ?? "")

