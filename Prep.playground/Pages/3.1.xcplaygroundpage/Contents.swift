import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 3


class NInOneStack<T> {
    private var valueArray: [T] = []
    private var numOfStack: Int = 0
    private var sizeStackArray: [Int] = []
    
    public init(numOfStack: Int) {
        self.numOfStack = numOfStack
        self.sizeStackArray = [Int](repeating: 0, count: numOfStack)
    }
    
    public func push(value: T, stackNum: Int) {
        assert((stackNum-1) < self.numOfStack, "Out of range")
        let index = self.firstIndexOf(stackNum: stackNum-1) + sizeStackArray[stackNum-1]
        self.valueArray.insert(value, at: index)
        self.sizeStackArray[stackNum-1] += 1
    }
    
    public func pop(stackNum: Int) -> T? {
        assert((stackNum-1) < self.numOfStack, "Out of range")
        if sizeStackArray[stackNum - 1] == 0 {
            return nil
        }
        let index = self.firstIndexOf(stackNum: stackNum-1) + sizeStackArray[stackNum-1]
        let item = self.valueArray.remove(at: index-1)
        self.sizeStackArray[stackNum-1] -= 1
        return item
    }
    
    private func firstIndexOf(stackNum: Int) -> Int {
        var count = 0
        for i in 0..<stackNum {
            count += self.sizeStackArray[i]
        }
        return count
    }
}

extension NInOneStack: CustomStringConvertible {
    public var description: String {
        var description = ""
        var index = 0
        if self.valueArray.isEmpty {
            return description
        }
        for i in 0..<numOfStack {
            description += "Stack \(i+1):"
            var count = 0
            if self.sizeStackArray[i] == 0 {
                description += "\n"
                continue
            }
            for j in 0..<self.sizeStackArray[i] {
                description += " \(self.valueArray[index + j])"
                count += 1
            }
            index = count
            description += "\n"
        }
        return description
    }
}

var test = NInOneStack<Int>(numOfStack: 4)
test.push(value: 3, stackNum: 1)
test.push(value: 4, stackNum: 1)
test.push(value: 10, stackNum: 1)
test.push(value: 1, stackNum: 2)
test.push(value: 4, stackNum: 3)
print(test, terminator: "\n")
test.pop(stackNum: 1)
test.pop(stackNum: 2)
test.pop(stackNum: 2)
print(test)
