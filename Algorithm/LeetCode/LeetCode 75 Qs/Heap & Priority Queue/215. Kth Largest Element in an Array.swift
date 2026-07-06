//
//  215. Kth Largest Element in an Array.swift
//  Algorithm
//
//  Created by 이정호 on 5/12/26.
//

import Foundation

extension LeetCode75 {
    class KthLargestElementInAnArray {
        func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
            var heap = Heap<Int>(comparer: <)
            for num in nums {
                heap.insert(num)
                if heap.nodes.count > k {
                    let _ = heap.pop()
                }
            }
            return heap.peek() ?? -1
        }
    }
}
