//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation
let test = LeetCode75.MaximumLevelSumOfABinaryTree()

let head1 = LeetCode75.TreeNode.createTree([1,7,0,7,-8,nil,nil])
let result1 = test.maxLevelSum(head1)
print(result1)
//LeetCode75.ListNode.printLinkedList(result1)

let head2 = LeetCode75.TreeNode.createTree([989,nil,10250,98693,-89388,nil,nil,nil,-32127])
let result2 = test.maxLevelSum(head2)
print(result2)

let head3 = LeetCode75.TreeNode.createTree([-100,-200,-300,-20,-5,-10,nil])
let result3 = test.maxLevelSum(head3)
print(result3)
