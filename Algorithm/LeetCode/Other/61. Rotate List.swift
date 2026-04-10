//
//  61. Rotate List.swift
//  Algorithm
//
//  Created by 이정호 on 11/22/24.
//

import Foundation

/*
 Given the head of a linked list, rotate the list to the right by `k` places.
 
 Example 1:
  - Input: head = [1,2,3,4,5], k = 2
  - Output: [4,5,1,2,3]
 
 Example 2:
  - Input: head = [0,1,2], k = 4
  - Output: [2,0,1]
  
 Constraints:
  - The number of nodes in the list is in the range [0, 500].
  - `-100 <= Node.val <= 100`
  - `0 <= k <= 2 * 10^9`
 */


extension LeetCode {
    
    class RotateList {
        
        func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
            guard let head = head, head.next != nil, k != 0 else {
                return head
            }
            
            // 리스트의 길이를 계산하고 마지막 노드를 찾습니다
            var last = head
            var length = 1
            while last.next != nil {
                last = last.next!
                length += 1
            }
            
            // 실제 회전 횟수를 계산합니다
            let rotations = length - (k % length)
            
            // 새로운 마지막 노드를 찾습니다
            var newLast = head
            for _ in 1..<rotations {
                newLast = newLast.next!
            }
            
            // 리스트를 회전합니다
            let newHead = newLast.next
            newLast.next = nil
            last.next = head
            
            return newHead
        }
        
    }
    
}

extension LeetCode.RotateList {
    
    class ListNode {
        
        var val: Int
        var next: ListNode?
        
        init() {
            self.val = 0
            self.next = nil
        }
        
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        
        init(_ val: Int, _ next: ListNode?) {
            self.val = val
            self.next = next
        }
        
        static func arrayToLinkedList(_ arr: [Int]) -> ListNode? {
            guard !arr.isEmpty else { return nil }
            
            let head = ListNode(arr[0])
            var current = head
            
            for value in arr.dropFirst() {
                current.next = ListNode(value)
                current = current.next!
            }
            
            return head
        }

        static func printLinkedList(_ node: ListNode?) {
            var current = node
            while let currentNode = current {
                print(currentNode.val, terminator: " -> ")
                current = currentNode.next
            }
            print("None")
        }

    }
    
}
