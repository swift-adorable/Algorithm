//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

let test = LeetCode.RotateList()

// Given array
let array = [1, 2, 3, 4, 5]

// Convert the array to a linked list
let linkedListHead = LeetCode.RotateList.ListNode.arrayToLinkedList(array)

// Print the linked list
LeetCode.RotateList.ListNode.printLinkedList(linkedListHead)

let value = test.rotateRight(linkedListHead, 2)
//print("output: \'\(value)\'")
