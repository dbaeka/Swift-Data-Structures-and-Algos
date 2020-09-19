import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 1

extension Character {
     func getCharIdx() -> Int {
          guard self.isLetter else { return -1 }
          return Int((self.asciiValue ?? 0) - (Character("a").asciiValue ?? 0))
      }
}

extension String {
    func isPalindromePerm1() -> Bool {
        var countFreq: [Character: Int] = [:]
        var charCount = 0
        for char in self {
            if char.isLetter {
                charCount+=1
                if let count = countFreq[char] {
                    countFreq[char] = count+1
                } else {
                    countFreq[ char] = 1
                }
            }
        }
        
        var countOdd = 0 // make sure odd character count is 1
        for value in countFreq.values {
            if charCount % 2 == 0 { // if string is even
                if value % 2 != 0 { // if any count is odd return false
                    return false
                }
            } else { // if string is odd
                if value % 2 != 0 {
                    countOdd+=1
                }
            }
        }
        return countOdd <= 1
    }
    
  
    /// Use a bit vector
    /// Each bit is toggled based on count. Even counts results in 0 and odd count results in multiple of power of 2
    func isPalindromePerm2() -> Bool {
        var bitVector: UInt64 = 0
        
        for char in self.lowercased() { // avoid issue of 'A' and 'a' ascii value
            if char.isLetter {
                let idx = char.getCharIdx() // get shifted index
                if idx >= 0 {
                    let mask: UInt64 = 1 << idx
                    bitVector ^= mask // toggle bit
                }
            }
        }
        return (bitVector == 0 || (bitVector & (bitVector - 1)) == 0) // test even or multiple of power of 2
    }
}


var test = "tact coabb"
print(test.isPalindromePerm1())
print(test.isPalindromePerm2())


