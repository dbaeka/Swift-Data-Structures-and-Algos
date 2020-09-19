import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 3

var test = Stack<Int>()
test.push(value: 3)
test.push(value: 5)
test.push(value: 6)
test.push(value: 2)
test.pop()
print(test)
test.min()
print(test)
