//
//  872. Leaf-Similar Trees.swift
//  Algorithm
//
//  Created by 이정호 on 4/8/26.
//

import Foundation

extension LeetCode75 {
    class LeafSimilarTrees {
        func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
            var result1: [Int] = []
            getLeafs(root1, &result1)
            var result2: [Int] = []
            getLeafs(root2, &result2)
            return result1 == result2
        }
        
        func getLeafs(_ root: TreeNode?, _ result: inout [Int]) {
            guard let root else { return }
            guard root.left == nil && root.right == nil else {
                getLeafs(root.left, &result)
                getLeafs(root.right, &result)
                return
            }
            result.append(root.val)
        }
    }
}
