import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


let first = [nil, 7]
let second = [8, nil]
let res = [first.compactMap({$0}), second.compactMap({$0}).reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)]
