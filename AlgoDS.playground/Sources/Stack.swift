import Foundation



open class Stack <T> where T: Comparable {
    private class StackNode <T>{
        var value: T
        var next: StackNode<T>?
        var minSubStack: StackNode<T>?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    public init() {}
    
    private var top: StackNode<T>?
    private var count = 0
    
    open func pop() -> T? {
        if top == nil { return nil }
        
        let item = top!.value
        top =  top!.next
        count -= 1
        return item
    }
    
    open func push(value: T) {
        let newValue = StackNode(value: value)
        newValue.next = top
        if top == nil {
            newValue.minSubStack = newValue
        } else {
            newValue.minSubStack = (top!.minSubStack!.value < value) ? top!.minSubStack : newValue
        }
        count += 1
        top = newValue
    }
    
    open func peek() -> T? {
        if top == nil { return nil }
        return top!.value
    }
    
    open var isEmpty: Bool {
        return top == nil
    }
    
    open func min() -> T? {
        if top == nil { return nil }
        return top!.minSubStack!.value
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        if self.isEmpty {
            return "Empty"
        }
        var description = ""
        var count = 0
        var node = top
        while count < self.count {
            description += (count == 0) ? "\(node!.value)  ⃪ top\n" : "\(node!.value)\n"
            if count != self.count - 1 {
                description += "↓\n"
            }
            node = node!.next
            count += 1
        }
        return description
    }
}
