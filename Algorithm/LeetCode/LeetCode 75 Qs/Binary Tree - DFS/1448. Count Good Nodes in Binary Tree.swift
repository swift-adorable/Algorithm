//
//  1448. Count Good Nodes in Binary Tree.swift
//  Algorithm
//
//  Created by 이정호 on 4/8/26.
//

import Foundation

extension LeetCode75 {
    class CountGoodNodesInBinaryTree {
        
        var currentIsGood = 0
        
        func goodNodes(_ root: TreeNode?) -> Int {
            return dfs(root, root?.val ?? Int.min)
        }
        
        private func dfs(_ node: TreeNode?, _ maxVal: Int) -> Int {
            guard let node = node else { return 0 }
            
            var nextMax = maxVal
            
            // 1. 현재 노드가 Good 노드인지 판별
            if node.val >= maxVal {
                currentIsGood = 1
                nextMax = node.val // 경로 최댓값 갱신
            }
            
            // 2. 결과 반환: (현재 노드 판정) + (왼쪽 서브트리 결과) + (오른쪽 서브트리 결과)
            return currentIsGood + dfs(node.left, nextMax) + dfs(node.right, nextMax)
        }

//        func goodNode(_ root: TreeNode?, _ maxVal: Int, _ count: Int) -> Int {
//            guard let root else { return count }
//            var count = count
//            if root.val >= maxVal { count += 1 }
//            let newMax = max(maxVal, root.val)
//            return goodNode(root.left, newMax, count) + goodNode(root.right, newMax, count)
//        }
    }
}
