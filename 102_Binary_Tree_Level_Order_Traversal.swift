import Foundation

enum LC_102_Binary_Tree_Level_Order_Traversal {

    class Solution {

        func levelOrder(_ root: TreeNode?) -> [[Int]] {
            guard let root = root else {
                return []
            }

            var result = [[Int]]()
            var queue = [TreeNode]()
            queue.append(root)

            while !queue.isEmpty {
                var size = queue.count
                var level = [Int]()

                while size > 0 {
                    let node = queue.removeFirst()
                    level.append(node.val)

                    if let left = node.left {
                        queue.append(left)
                    }

                    if let right = node.right {
                        queue.append(right)
                    }

                    size -= 1
                }

                result.append(level)
            }

            return result
        }

    }

}

extension LC_102_Binary_Tree_Level_Order_Traversal {

    // Definition for a binary tree node.
    public class TreeNode {

        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }

    }

}