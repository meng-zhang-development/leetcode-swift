
import Foundation

enum LC_133_Clone_Graph {

        class Solution {

            func cloneGraph(_ node: Node?) -> Node? {
                guard let node = node else {
                    return nil
                }

                var created = [Int: Node]()
                created[node.val] = Node(node.val)

                var q = [Node]()
                q.append(node)

                while !q.isEmpty {
                    let curr = q.removeFirst()

                    for neighbor in curr.neighbors {
                        if let neighbor = neighbor {
                            var newNeighbor: Node
                            if let nei = created[neighbor.val] {
                                newNeighbor = nei
                            } else {
                                newNeighbor = Node(neighbor.val)
                                created[neighbor.val] = newNeighbor
                                q.append(neighbor)
                            }

                            created[curr.val]?.neighbors.append(newNeighbor)
                        }
                    }
                }

                return created[node.val]
            }

        }

}

extension LC_133_Clone_Graph {

    // Definition for a Node.
    class Node {

        public var val: Int
        public var neighbors: [Node?]
        public init(_ val: Int) {
            self.val = val
            self.neighbors = []
        }

    }

}