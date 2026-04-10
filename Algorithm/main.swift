//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation
let test = LeetCode75.LowestCommonAncestorOfABinaryTree()

let head1 = LeetCode75.TreeNode.createTree([3,5,1,6,2,0,8,nil,nil,7,4])
let result1 = test.lowestCommonAncestor(head1, .init(5), .init(1))
result1?.printTree()
print(result1)
//LeetCode75.ListNode.printLinkedList(result1)

let head2 = LeetCode75.TreeNode.createTree([3,5,1,6,2,0,8,nil,nil,7,4])
let result2 = test.lowestCommonAncestor(head2, .init(5), .init(4))
result2?.printTree()
print(result2)
