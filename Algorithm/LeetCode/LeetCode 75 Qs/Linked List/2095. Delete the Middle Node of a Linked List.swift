//
//  2095. Delete the Middle Node of a Linked List.swift
//  Algorithm
//
//  Created by 이정호 on 3/31/26.
//

import Foundation

extension LeetCode75 {
    
    class DeleteTheMiddleNodeOfALinkedList {
        func deleteMiddle(_ head: ListNode?) -> ListNode? {
            if head?.next == nil { return nil }
            
            var n = 0
            var temp: ListNode? = head
            
            while temp != nil {
                n += 1
                temp = temp?.next
            }
            
            let mid = n / 2
            
            temp = head
            
            for _ in 0..<(mid-1) {
                temp = temp?.next
            }
            
            temp?.next = temp?.next?.next
            
            return head
        }
        
    }
    
}
