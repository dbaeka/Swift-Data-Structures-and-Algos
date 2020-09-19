import Foundation

public class Queue <T> {
    private class QueueNode <T>{
        var value: T
        var next: QueueNode<T>?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    private var first: QueueNode<T>?
    private var last: QueueNode<T>?
    private var count = 0
    
    public init() {}
    
    public func remove() -> T? {
        if first == nil { return nil }
        
        let item = first!.value
        first =  first!.next
        if first == nil {
            last = nil
        }
        count -= 1
        return item
    }
    
    public func add(value: T) {
        let newValue = QueueNode(value: value)
        if last != nil {
            last!.next = newValue
        }
        last = newValue
        
        count += 1
        if first == nil {
            first = last
        }
    }
    
    public func peek() -> T? {
        if first == nil { return nil }
        return first!.value
    }
    
    public var isEmpty: Bool {
        return first == nil
    }
}


extension Queue: CustomStringConvertible {
    public var description: String {
        if self.isEmpty {
            return "Empty"
        }
        var description = ""
        var count = 0
        var node = first
        while count < self.count {
            description += (count == 0) ? "\(node!.value)  ⃪ first\n" : "\(node!.value)\n"
            if count != self.count - 1 {
                description += "↑\n"
            }
            node = node!.next
            count += 1
        }
        return description
    }
}
