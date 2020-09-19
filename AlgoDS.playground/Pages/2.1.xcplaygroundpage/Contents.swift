
import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 2

extension SinglyLinkedList {
    func removeDupsHash() {
        guard let head = self.head else { return }
        
        var countTable: [T: Int] = [:]
        countTable[head.getValue] = 1
        var node = self.head
        var prev = node
        while node!.next != nil {
            prev = node
            node = node!.next
            if countTable[node!.getValue] == nil {
                countTable[node!.getValue] = 1
            } else {
                // remove the duplicate
                prev!.next = node!.next
            }
        }
    }
    
    func removeDupsRunner() {
        guard let first = self.head, first.next != nil else { return }
        
        var firstPointer = self.head
        while firstPointer != nil {
            var secondPointer = firstPointer
            while secondPointer!.next != nil {
                // remove duplicate
                if firstPointer!.getValue == secondPointer!.next!.getValue {
                    secondPointer!.next = secondPointer!.next!.next
                } else {
                    secondPointer = secondPointer!.next
                }
            }
            firstPointer = firstPointer!.next
        }
    }
}


var test = SinglyLinkedList<Int>()

test.prepend(value: 20)
test.prepend(value: 30)
test.append(value: 10)
test.append(value: 20)
test.append(value: 20)
test.prepend(value: 20)
test.removeDupsRunner()
print(test)

