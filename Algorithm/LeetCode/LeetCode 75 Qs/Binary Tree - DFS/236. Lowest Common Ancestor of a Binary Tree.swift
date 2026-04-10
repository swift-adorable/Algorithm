//
//  236. Lowest Common Ancestor of a Binary Tree.swift
//  Algorithm
//
//  Created by 이정호 on 4/10/26.
//

import Foundation

extension LeetCode75 {
    class LowestCommonAncestorOfABinaryTree {
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            return dfs(root, p, q)
        }
        
        func dfs(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            guard let root else { return nil }
            if root.val == p?.val || root.val == q?.val { return root }
            let left = dfs(root.left, p, q)
            let right = dfs(root.right, p, q)
            if left != nil && right != nil {
                return root
            }
            return left ?? right
        }
    }
}
