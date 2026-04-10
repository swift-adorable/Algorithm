//
//  1372. Longest ZigZag Path in a Binary Tree.swift
//  Algorithm
//
//  Created by 이정호 on 4/9/26.
//

import Foundation

extension LeetCode75 {
    class LongestZigZagPathInABinaryTree {
        func longestZigZag(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }
            return dfs(root, 0)
        }
        
        func dfs(_ node: TreeNode?, _ maxCount: Int) -> Int {
            guard let node else { return maxCount }
            return max(
                dfs(node.left, true, maxCount),
                dfs(node.right, false, maxCount)
            )
        }
        
        func dfs(_ node: TreeNode?, _ isLeft: Bool, _ maxCount: Int) -> Int {
            guard let node else { return maxCount }
            return max(
                dfs(node.left, true, isLeft ? 0 : maxCount + 1),
                dfs(node.right, false, isLeft ? maxCount + 1 : 0)
            )
        }
    }
}
