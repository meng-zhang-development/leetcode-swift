import Foundation

enum LC_100_Same_Tree {

    class Solution {

        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if !compareNode(p, q) {
                return false
            }

            var queue1 = [TreeNode?]()
            var queue2 = [TreeNode?]()

            queue1.append(p)
            queue2.append(q)

            while !queue1.isEmpty {
                let p = queue1.removeFirst()
                let q = queue2.removeFirst()

                if !compareNode(p?.left, q?.left) {
                    return false
                }

                if p?.left != nil {
                    queue1 += [p?.left]
                    queue2 += [q?.left]
                }

                if !compareNode(p?.right, q?.right) {
                    return false
                }

                if p?.right != nil {
                    queue1 += [p?.right]
                    queue2 += [q?.right]
                }
            }

            return true
        }

        func compareNode(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil {
                return true
            } else if p == nil || q == nil {
                return false
            } else {
                return p?.val == q?.val
            }
        }

    }

}

extension LC_100_Same_Tree {

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