import Foundation

enum LC_124_Binary_Tree_Maximum_Path_Sum {

    class Solution {

        func maxPathSum(_ root: TreeNode?) -> Int {
            var res = Int.min
            _ = maxPathSumFor(root, &res)
            return res
        }

        func maxPathSumFor(_ root: TreeNode?, _ res: inout Int) -> Int {
            guard let root = root else {
                return 0
            }

            let left = max(maxPathSumFor(root.left, &res), 0)
            let right = max(maxPathSumFor(root.right, &res), 0)
            let result = max(left, right) + root.val
            res = max(res, left + right + root.val)

            return result
        }

    }

}

extension LC_124_Binary_Tree_Maximum_Path_Sum {

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