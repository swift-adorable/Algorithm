//
//  TreeNode.swift
//  Algorithm
//
//  Created by 이정호 on 4/8/26.
//

import Foundation

extension LeetCode75 {
    /// Definition for a binary tree node.
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
        
        static func createTree(_ array: [Int?]) -> TreeNode? {
            // 1. 빈 배열 처리
            guard !array.isEmpty, let firstVal = array[0] else { return nil }
            
            let root = TreeNode(firstVal)
            var queue: [TreeNode] = [root]
            
            var i = 1
            while i < array.count {
                // 큐에서 현재 부모 노드를 꺼냄
                let parent = queue.removeFirst()
                
                // 3. 왼쪽 자식 연결
                if i < array.count, let leftVal = array[i] {
                    let leftNode = TreeNode(leftVal)
                    parent.left = leftNode
                    queue.append(leftNode) // 자식도 나중에 부모가 되므로 큐에 추가
                }
                i += 1
                
                // 4. 오른쪽 자식 연결
                if i < array.count, let rightVal = array[i] {
                    let rightNode = TreeNode(rightVal)
                    parent.right = rightNode
                    queue.append(rightNode)
                }
                i += 1
            }
            
            return root
        }
    }

}

extension LeetCode75.TreeNode {
    /// 이진 트리를 콘솔에 시각적으로 출력합니다.
    public func printTree() {
        print("────────────────────────────────")
        printNode(self, "", true, nil)
        print("────────────────────────────────")
    }

    private func printNode(_ node: LeetCode75.TreeNode?, _ prefix: String, _ isTail: Bool, _ label: String?) {
        guard let node = node else { return }
        
        // 자식 노드 표시용 라벨 (L/R)
        let nodeLabel = label != nil ? "[\(label!)] " : ""
        
        // 현재 노드 출력
        print(prefix + (isTail ? "└── " : "├── ") + nodeLabel + "\(node.val)")
        
        // 자식 노드들을 배열에 담음 (nil이 아닌 것만 처리하거나 구조 유지를 위해 포함 가능)
        let children = [
            (node.left, "L"),
            (node.right, "R")
        ].filter { $0.0 != nil }
        
        for (index, child) in children.enumerated() {
            let isLast = index == children.count - 1
            printNode(child.0, prefix + (isTail ? "    " : "│   "), isLast, child.1)
        }
    }
}
