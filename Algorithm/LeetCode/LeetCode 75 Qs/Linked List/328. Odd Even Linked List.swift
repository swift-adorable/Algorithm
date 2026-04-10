//
//  328. Odd Even Linked List.swift
//  Algorithm
//
//  Created by 이정호 on 4/1/26.
//

import Foundation

extension LeetCode75 {
    class OddEvenLinkedList {
        func oddEvenList(_ head: ListNode?) -> ListNode? {
            var buffer = head
            var odd: ListNode? = buffer
            var even: ListNode? = buffer?.next
            let evenHead = even
            buffer = buffer?.next?.next
            
            while buffer != nil {
                odd?.next = buffer
                odd = odd?.next
                even?.next = buffer?.next
                even = even?.next
                buffer = buffer?.next?.next
            }
            
            odd?.next = evenHead
            return head
        }
        
//        func oddEvenList(_ head: ListNode?) -> ListNode? {
//            // 노드가 0개 또는 1개, 2개일 때는 처리할 게 없음
//            if head == nil || head?.next == nil { return head }
//            
//            var odd = head
//            var even = head?.next
//            let evenHead = even // 짝수 그룹의 시작점 박제
//            
//            // 토끼와 거북이처럼 fast(even)가 끝날 때까지 달림
//            while even != nil && even?.next != nil {
//                odd?.next = even?.next      // 홀수는 다음 홀수로
//                odd = odd?.next             // 이동
//                
//                even?.next = odd?.next      // 짝수는 다음 짝수로
//                even = even?.next           // 이동
//            }
//            
//            // 홀수 그룹의 마지막을 짝수 그룹의 시작과 연결
//            odd?.next = evenHead
//            
//            return head
//        }
    }
}
