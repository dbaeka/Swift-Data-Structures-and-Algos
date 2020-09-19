import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


extension String {
    
    func isPermutation(of value: String) -> Bool {
        if self.count != value.count { return false }
        for char in self {
            if !value.contains(char) {
                return false
            }
        }
        return true
    }
}


let test = "abcd"
print(test.isPermutation(of: "dcan"))
