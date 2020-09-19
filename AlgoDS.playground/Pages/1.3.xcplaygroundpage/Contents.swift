import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 1

extension String {
    func urlfy() -> String {
        var newString = ""
        for char in self {
            newString += (char == " ") ? "%20" : String(char)
        }
        return newString
    }
}


var test = "abc d"
print(test.urlfy())

