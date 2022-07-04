import Foundation

enum LC_101_Symmetric_Tree {

    class Solution_Recusive {

        func isSymmetric(_ root: TreeNode?) -> Bool {
            if root == nil {
                return false
            }

            return checkNodes(left: root?.left, right: root?.right)
        }

        func checkNodes(left: TreeNode?, right: TreeNode?) -> Bool {
            if left == nil && right == nil {
                return true
            }

            if left == nil || right == nil {
                return false
            }

            if left!.val != right!.val {
                return false
            }

            return checkNodes(left: left?.left, right: right?.right)
            && checkNodes(left: left?.right, right: right?.left)
        }

    }

    class Solution_Iterative {

        func isSymmetric(_ root: TreeNode?) -> Bool {
            let left = root?.left
            let right = root?.right

            if root == nil || (left == nil && right == nil) {
                return true
            }

            var q = [TreeNode?]()
            q.insert(left, at: 0)
            q.insert(right, at: 0)

            while !q.isEmpty {
                let n1 = q.removeLast()
                let n2 = q.removeLast()

                if n1 == nil && n2 == nil {
                    continue
                }

                if (n1 == nil || n2 == nil) || (n1?.val != n2?.val) {
                    return false
                }

                q.insert(n1?.left, at: 0)
                q.insert(n2?.right, at: 0)
                q.insert(n1?.right, at: 0)
                q.insert(n2?.left, at: 0)
            }

            return true
        }
    }

}

extension LC_101_Symmetric_Tree {

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