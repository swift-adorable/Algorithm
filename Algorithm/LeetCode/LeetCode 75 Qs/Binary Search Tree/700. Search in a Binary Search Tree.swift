//
//  700. Search in a Binary Search Tree.swift
//  Algorithm
//
//  Created by 이정호 on 4/15/26.
//

import Foundation

extension LeetCode75 {
    class SearchInABinarySearchTree {
        func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
            guard let root else { return nil }
            var node: TreeNode? = root
            while let n = node {
                if n.val == val {
                    return n
                } else if n.val > val {
                    node = n.left
                } else {
                    node = n.right
                }
            }
            return node
        }
    }
}
