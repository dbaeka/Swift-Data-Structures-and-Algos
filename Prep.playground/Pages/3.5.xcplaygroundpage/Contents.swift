import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 3


class SortedStack<T: Comparable>: Stack<T> {
   
    public override func push(value: T) {
        if isEmpty {
            super.push(value: value)
        } else {
            if super.peek()! > value {
                super.push(value: value)
            } else {
                super.push(value: value)
                self.sort()
            }
        }
    }
    
    private func sort() {
        let helper = Stack<T>()
        while !isEmpty {
            let value = pop()!

            // Move greater than 'value' elements from 'helper' to 'stack'
            while !helper.isEmpty && value < helper.peek()! {
                super.push(value: helper.pop()!)
            }
            
            // Place 'value' above smaller element into 'helper'
            helper.push(value: value)
        }

        // Copy from 'helper' into 'stack' in reversed order
        while !helper.isEmpty {
            super.push(value: helper.pop()!)
        }
    }
}

var test = SortedStack<Int>()
test.push(value: 4)
test.push(value: 2)
test.push(value: 5)
print(test)
