import Foundation

enum LC_110_Balanced_Binary_Tree {

    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }

        return helper(root) != -1
    }

    func helper(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let left = helper(root?.left)
        let right = helper(root?.right)

        if left == -1 || right == -1 || abs(left - right) > 1 {
            return -1
        }

        return max(left, right) + 1
    }

}

extension LC_110_Balanced_Binary_Tree {

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