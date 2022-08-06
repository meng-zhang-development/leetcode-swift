import Foundation

enum LC_105_Construct_Binary_Tree_From_Preorder_And_Inorder_Traversal {

    class Solution {

        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
            guard preorder.count > 0, inorder.count > 0 else {
                return nil
            }

            var preorder = preorder
            var inorder = inorder
            var inorderIndexMap = [Int: Int]()
            for index in 0 ..< inorder.count {
                inorderIndexMap[inorder[index]] = index
            }

            return buildTree(&preorder, &inorder, 0, 0, inorder.count - 1, &inorderIndexMap)
        }

        func buildTree(_ preorder: inout [Int],
                       _ inorder: inout [Int],
                       _ preStart: Int,
                       _ inStart: Int,
                       _ inEnd: Int,
                       _ indexMap: inout [Int: Int]) -> TreeNode? {

            if preStart >= preorder.count || inStart > inEnd {
                return nil
            }

            let rootValue = preorder[preStart]
            let root = TreeNode(rootValue)
            let rootIndexInOrder = indexMap[rootValue]!

            root.left = buildTree(&preorder,
                                  &inorder,
                                  preStart + 1,
                                  inStart,
                                  rootIndexInOrder - 1,
                                  &indexMap)

            root.right = buildTree(&preorder,
                                   &inorder,
                                   preStart + rootIndexInOrder - inStart + 1,
                                   rootIndexInOrder + 1,
                                   inEnd,
                                   &indexMap)

            return root

        }

    }
}

extension LC_105_Construct_Binary_Tree_From_Preorder_And_Inorder_Traversal {

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