import Foundation

open class GraphNode<T: Hashable & Comparable> {

    
    public var data: T
    public var adjacentNodes: [GraphNode<T>]?
    public var visited = false
    
    public init(data: T, adjacentNodes: [GraphNode<T>]?) {
           self.data = data
           self.adjacentNodes = adjacentNodes
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(data)
    }
    
    func connectNode(node: GraphNode<T>) {
        adjacentNodes?.append(node)
        if adjacentNodes == nil {
            adjacentNodes = [node]
        }
    }
}

extension GraphNode: Comparable {
    public static func < (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    public static func == (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data == rhs.data
    }
}


extension GraphNode: CustomStringConvertible {
    
    public var description: String {
        var description = "\(data) ->"
        adjacentNodes?.forEach { e in
            description += " \(e.data),"
        }
        return description + " visited \(visited)"
    }
}

public struct Graph<T: Hashable & Comparable> {
    public let nodes: [GraphNode<T>]
    
    public func markNodesUnvisited() {
        nodes.forEach { node in
            node.visited = false
        }
    }
        
    public func find(_ data: T) -> GraphNode<T>? {
        return nodes.first(where: {$0.data == data})
    }
}


public extension Graph {
    
    init(connectedNodes: [T: [T]], unconnectedNodes: [T]? = nil) {
        var nodeDictionary = [T: GraphNode<T>]()
        connectedNodes.forEach { data, adjacentData in
            let node = nodeDictionary[data] ?? GraphNode(data: data, adjacentNodes: nil)
            nodeDictionary[data] = node
            adjacentData.forEach { i in
                let adjacentNode = nodeDictionary[i] ?? GraphNode(data: i, adjacentNodes: nil)
                nodeDictionary[i] = adjacentNode
                node.connectNode(node: adjacentNode)
            }
        }
        var nodes = Array(nodeDictionary.values)
        if let unnconnectedNodes = unconnectedNodes?.map ({ GraphNode(data: $0, adjacentNodes: nil) }) {
            nodes += unnconnectedNodes
        }
        self.nodes = nodes
    }
}
