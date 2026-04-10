//
//  2130. Maximum Twin Sum of a Linked List.swift
//  Algorithm
//
//  Created by 이정호 on 4/1/26.
//

import Foundation

extension LeetCode75 {
    class MaximumTwinSumOfALinkedList {
        func pairSum(_ head: ListNode?) -> Int {
            var buffer: [Int] = []
            var node: ListNode? = head
            var cnt: Int = 0
            while let value = node?.val {
                buffer.append(value)
                node = node?.next
                cnt += 1
            }
            
            let mid = cnt / 2
            var max = 0
            for i in 0..<mid {
                let sum = buffer[i] + buffer[cnt-1-i]
                if max < sum {
                    max = sum
                }
            }
            
            return max
        }
    }
    /*
     class Solution {
         func pairSum(_ head: ListNode?) -> Int {
             // 1. 중간 지점 찾기 (Fast & Slow)
             var slow = head
             var fast = head
             while fast != nil && fast?.next != nil {
                 slow = slow?.next
                 fast = fast?.next?.next
             }
             
             // 2. 리스트의 뒷부분 뒤집기 (Reverse Second Half)
             // slow가 가리키는 지점이 두 번째 파트의 시작입니다.
             var prev: ListNode? = nil
             var curr = slow
             while curr != nil {
                 let nextNode = curr?.next
                 curr?.next = prev
                 prev = curr
                 curr = nextNode
             }
             
             // 3. 양 끝에서 안쪽으로 오며 최대 트윈 합 계산
             // prev는 이제 뒤집힌 리스트의 새로운 머리(끝 노드)가 됩니다.
             var firstHalf = head
             var secondHalf = prev
             var maxVal = 0
             
             while secondHalf != nil {
                 if let v1 = firstHalf?.val, let v2 = secondHalf?.val {
                     maxVal = max(maxVal, v1 + v2)
                 }
                 firstHalf = firstHalf?.next
                 secondHalf = secondHalf?.next
             }
             
             return maxVal
         }
     }
     */
}
