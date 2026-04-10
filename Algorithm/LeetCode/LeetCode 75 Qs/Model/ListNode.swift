//
//  ListNode.swift
//  Algorithm
//
//  Created by 이정호 on 4/8/26.
//

import Foundation

extension LeetCode75 {
    
    public class ListNode {
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
            
            static func createLinkedList(_ array: [Int]) -> ListNode? {
                guard !array.isEmpty else { return nil }
                
                let head = ListNode(array[0])
                var current = head
                
                for i in 1..<array.count {
                    current.next = ListNode(array[i])
                    current.next.map { current = $0 }
                }
                
                return head
            }
            
            static func printLinkedList(_ head: ListNode?) {
                var current = head
                var values: [Int] = []
                while let node = current {
                    values.append(node.val)
                    current = node.next
                }
                print(values.isEmpty ? "Empty List" : values.map(String.init).joined(separator: " -> "))
            }
            
        }

}
