//
//  450. Delete Node in a BST.swift
//  Algorithm
//
//  Created by 이정호 on 4/15/26.
//

import Foundation

extension LeetCode75 {
    class DeleteNodeInABST {
        func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
            guard let root = root else { return nil }
            
            if key < root.val {
                root.left = deleteNode(root.left, key)
            } else if key > root.val {
                root.right = deleteNode(root.right, key)
            } else {
                if root.left == nil { return root.right }
                if root.right == nil { return root.left }
                
                let minNode = findMin(root.right!)
                
                root.val = minNode.val
                
                root.right = deleteNode(root.right, minNode.val)
            }
            
            return root
        }

        private func findMin(_ node: TreeNode) -> TreeNode {
            var current = node
            while let left = current.left {
                current = left
            }
            return current
        }
    }
}
