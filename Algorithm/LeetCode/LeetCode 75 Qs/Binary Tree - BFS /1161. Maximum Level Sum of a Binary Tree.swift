//
//  1161. Maximum Level Sum of a Binary Tree.swift
//  Algorithm
//
//  Created by 이정호 on 4/14/26.
//

import Foundation

extension LeetCode75 {
    class MaximumLevelSumOfABinaryTree {
        func maxLevelSum(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }
            var queue: [TreeNode] = [root]
            var pointer = 0
            var depth = 1
            var currentDepth = 0
            var max = root.val
            while pointer < queue.count {
                let currentCount = queue.count - pointer
                
                var sum = 0
                for idx in pointer..<queue.count {
                    sum += queue[idx].val
                }

                currentDepth += 1

                if max < sum {
                    max = sum
                    depth = currentDepth
                }
                
                for _ in 0..<currentCount {
                    let node = queue[pointer]
                    pointer += 1
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                }
            }
            
            return depth
        }
    }
}
