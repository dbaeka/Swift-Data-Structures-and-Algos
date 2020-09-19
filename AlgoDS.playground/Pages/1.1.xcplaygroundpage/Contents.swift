import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 1

extension String {
    func hasUniqueCharacters() -> Bool {
        var uniqueChar = Set<Character>() // hash table solution
        for c in self {
            // check if character already exists
            guard !uniqueChar.contains(c) else { return false }
            uniqueChar.insert(c)
        }
        return true
    }
    
    func hasUniqueCharOptimized() -> Bool {
        let sortedString = self.sorted()
        for i in 0..<sortedString.count-1 {
            for j in i+1..<sortedString.count {
                if sortedString[i] == sortedString[j] {
                    return false
                }
            }
        }
        return true
    }
}


let test = "abcd"
print(test.hasUniqueCharacters())
print(test.hasUniqueCharOptimized())

