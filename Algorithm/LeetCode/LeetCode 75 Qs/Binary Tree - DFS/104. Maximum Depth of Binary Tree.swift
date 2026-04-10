//
//  104. Maximum Depth of Binary Tree.swift
//  Algorithm
//
//  Created by 이정호 on 4/8/26.
//

import Foundation

extension LeetCode75 {
    class MaximumDepthOfBinaryTree {
        func maxDepth(_ root: TreeNode?) -> Int {
            dfs(root, 0)
        }
        
        func dfs(_ root: TreeNode?, _ count: Int) -> Int {
            guard let root else { return count }
            return max(dfs(root.left, count + 1), dfs(root.right, count + 1))
        }
    }
}
