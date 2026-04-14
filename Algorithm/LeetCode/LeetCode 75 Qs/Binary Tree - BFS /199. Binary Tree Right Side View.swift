//
//  199. Binary Tree Right Side View.swift
//  Algorithm
//
//  Created by 이정호 on 4/13/26.
//

import Foundation

extension LeetCode75 {
    class BinaryTreeRightSideView {
        func rightSideView(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [] }
            
            var queue: [TreeNode] = [root]
            var results = [Int]()
            var pointer = 0 // 실제 삭제 대신 인덱스만 이동 (O(1) 성능 확보)
            
            // 포인터가 큐의 끝에 도달할 때까지 반복
            while pointer < queue.count {
                // 현재 시점의 큐 개수가 아닌, '현재 레벨'의 노드 개수를 계산
                let currentLevelCount = queue.count - pointer
                
                for i in 0..<currentLevelCount {
                    let node = queue[pointer]
                    pointer += 1
                    
                    // 현재 레벨의 마지막 노드라면 결과에 추가
                    if i == currentLevelCount - 1 {
                        results.append(node.val)
                    }
                    
                    if let left = node.left {
                        queue.append(left)
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                }
            }
            return results
        }
//        func rightSideView(_ root: TreeNode?) -> [Int] {
//            guard let root else { return [] }
//            var queue: [TreeNode] = [root]
//            var results = [Int]()
//            
//            while !queue.isEmpty {
//                let count = queue.count
//                
//                for i in 0..<count {
//                    let node = queue.removeFirst()
//                                        
//                    if i == count - 1 {
//                        results.append(node.val)
//                    }
//                    
//                    if let left = node.left {
//                        queue.append(left)
//                    }
//                    if let right = node.right {
//                        queue.append(right)
//                    }
//                }
//            }
//            
//            return results
//        }
    }
}
