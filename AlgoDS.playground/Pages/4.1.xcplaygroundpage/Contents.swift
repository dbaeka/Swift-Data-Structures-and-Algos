import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 4


extension Graph {
    
    func hasRouteDFS(from: T, to: T) -> Bool {
        markNodesUnvisited()
        guard let fromNode = find(from) else {
            return false
        }
//        return DFSSearch(from: fromNode, to: to)
        return fromNode.dfsSearch(to)
    }
    
    func hasRouteBFS(from: T, to: T) -> Bool {
        markNodesUnvisited()
        guard let fromNode = find(from) else {
            return false
        }
        
        return BFSSearch(from: fromNode, to: to)
    }
    
    private func BFSSearch(from: GraphNode<T>?, to: T) -> Bool {
        guard from != nil else { return false }
        let queue = Queue<GraphNode<T>>()
        from!.visited = true
        queue.add(value: from!)
        while !queue.isEmpty {
            let curr = queue.remove()
            if curr!.data == to { return true }
            guard let adjacentNodes = curr!.adjacentNodes else { continue }
            for node in adjacentNodes where node.visited == false {
                node.visited = true
                queue.add(value: node)
            }
        }
        return false
    }
    
    private func DFSSearch(from: GraphNode<T>?, to: T) -> Bool {
        guard from != nil else { return false }
        if from!.data == to { return true }
        from!.visited = true
        guard let adjacentNodes = from!.adjacentNodes else { return false }
        for node in adjacentNodes where node.visited == false {
            guard !DFSSearch(from: node, to: to) else { return true}
        }
        return false
    }
}

extension GraphNode {
    
    fileprivate func dfsSearch(_ data: T) -> Bool {
        visited = true
        guard self.data != data else { return true }
        guard let adjacentNodes = adjacentNodes else { return false }
        for node in adjacentNodes where node.visited == false {
            guard !node.dfsSearch(data) else { return true }
        }
        return false
    }
}


let connectedNodes = [0: [1,4,5], 1: [3,4], 2: [1], 3: [2,4]]

var graph = Graph(connectedNodes: connectedNodes)
print(graph.hasRouteDFS(from: 0, to: 2))
print(graph.hasRouteBFS(from: 0, to: 2))
