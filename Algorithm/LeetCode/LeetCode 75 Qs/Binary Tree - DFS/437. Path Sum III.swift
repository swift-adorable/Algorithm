//
//  437. Path Sum III.swift
//  Algorithm
//
//  Created by 이정호 on 4/9/26.
//

import Foundation

extension LeetCode75 {
    class PathSumIII {
        func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
            // [누적 합: 해당 합이 등장한 횟수]
            var prefixSumCount: [Int: Int] = [0: 1]
            return dfs(root, targetSum, 0, &prefixSumCount)
        }
        
        private func dfs(_ node: TreeNode?, _ targetSum: Int, _ currentSum: Int, _ prefixSumCount: inout [Int: Int]) -> Int {
            guard let node = node else { return 0 }
            
            let newSum = currentSum + node.val
            
            // 1. (현재 합 - targetSum)이 이전에 있었는지 확인
            // 이 차이만큼의 합을 가진 이전 지점부터 현재까지의 합이 곧 targetSum이 됨
            var count = prefixSumCount[newSum - targetSum] ?? 0
            
            // 2. 현재 누적 합을 기록 (다음 자식 노드들을 위해)
            prefixSumCount[newSum, default: 0] += 1
            
            // 3. 자식 노드로 탐색 진행
            count += dfs(node.left, targetSum, newSum, &prefixSumCount)
            count += dfs(node.right, targetSum, newSum, &prefixSumCount)
            
            // 4. 백트래킹 (중요!): 현재 노드 탐색이 끝나면 다른 경로에 영향을 주지 않도록 제거
            prefixSumCount[newSum]! -= 1
            
            return count
        }
        
//        func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
//            return dfs(root, targetSum, 0, [])
//        }
//        
//        func dfs(_ root: TreeNode?, _ targetSum: Int, _ sum: Int, _ values: [Int]) -> Int {
//            guard let root else { return 0 }
//            var count = 0
//            var values = values
//            var newSum = sum + root.val
//            values.append(root.val)
//            if newSum == targetSum {
//                count += 1
//            }
//            while newSum > targetSum && !values.isEmpty {
//                let value = values.removeFirst()
//                newSum -= value
//                if newSum == targetSum {
//                    count += 1
//                }
//            }
//            return count + dfs(root.left, targetSum, newSum, values) + dfs(root.right, targetSum, newSum, values)
//        }
        
    }
}
