import Foundation

public class Node <T>{
    var value: T
    public var next: Node<T>?
    weak public var previous: Node<T>?
    
    public var getValue:T {
        return value
    }
    
    public init(value: T) {
        self.value = value
    }
}


public class DoubleLinkedList<T> {
    // MARK:- Private properties
    
    internal var head: Node<T>?
    internal var tail: Node<T>?
    private var _count: Int = 0
    
    public init() {}
    
    // MARK:- Public properties
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public var count: Int {
        return _count
    }
    
    
    // MARK:- Public Functions
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {  // if tail is not empty
            newNode.previous = tailNode // point the new node previous to tail
            tailNode.next = newNode // point old tailnode next from nil to point to new node
        } else { //if totally empty
            self.head = newNode
        }
        
        //make tail be newNode
        self.tail = newNode
        self._count+=1
    }
    
    public func removeAll() {
        self.head = nil
        self.tail = nil
        self._count = 0
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = self.head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            self.head = next
        }
        next?.previous = prev
        
        if next == nil {
            self.tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        self._count-=1
        return node.value
    }
}


public class SinglyLinkedList<T: Hashable & Comparable>: Comparable {
    // MARK:- Private properties
    
    public var head: Node<T>? {
        get {
            return _head
        }
        set(newValue) {
            invalidateCount = true
            _head = newValue
        }
    }
    
    private var _head: Node<T>?
    private var _count: Int = 0
    private var invalidateCount = false
    
    public init() {}
    
    // MARK:- Public properties
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var count: Int {
        if invalidateCount {
            var node = _head
            var count = 0
            while node != nil {
                count += 1
                node = node!.next
            }
            _count = count
            invalidateCount = false
        }
        return _count
    }
    
    
    // MARK:- Public Functions
    
    static public func < (lhs: SinglyLinkedList, rhs: SinglyLinkedList) -> Bool {
        return lhs.count < rhs.count
    }
    
    static public func == (lhs: SinglyLinkedList, rhs: SinglyLinkedList) -> Bool {
        return lhs.count == rhs.count
    }
    
    public func prepend(value: T) {
        let newNode = Node(value: value)
        
        if let headNode = head {  // if head is not empty
            newNode.next = headNode
        }
        
        self._count+=1
        self.head = newNode
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
       
        guard self.head != nil else {
            self.head = newNode
            self._count+=1
            return
        }
        
        var node = self.head
        
        while node!.next != nil {
            node = node!.next
        }
        
        node!.next = newNode
        self._count+=1
    }
    
    public func removeAll() {
        self.head = nil
        self._count = 0
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 && index < self._count {
            var node = self.head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func remove(index: Int) -> Node<T>? {
        if index >= 0 && index < self._count {
            var node = self.head
            var prev: Node<T>? = nil
            var i = index
            while node != nil {
                if i == 0 { // if reached target
                    if index == 0 { // if head
                        self.head = node!.next
                    } else {
                        if let prev = prev {
                            prev.next = node!.next
                        }
                    }
                    self._count -= 1
                    return node
                }
                i -= 1
                node = node!.next
                prev = node
            }
        }
        return nil
    }
}

extension SinglyLinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = self.head else { return "nil" }
        var description = "\(head.value)"
        var node = head.next
        while node != nil {
            description += " -> \(node!.value)"
            node = node!.next
        }
        return description + " -> " + "nil"
    }
}

