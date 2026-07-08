//
//  2542. Maximum Subsequence Score.swift
//  Algorithm
//
//  Created by 이정호 on 7/7/26.
//

extension LeetCode75 {
    class MaximumSubsequenceScore {
       
        func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
            let n = nums1.count
            
            let pair = zip(nums1, nums2).sorted { $0.1 > $1.1 }
            
            var max = 0
            var currentSum = 0
            var heap: Heap<Int> = .init(comparer: <)
            
            for i in 0..<n {
                
                let val = pair[i].0
                heap.insert(val)
                currentSum += val
                
                if heap.count > k {
                    if let min = heap.pop() {
                        currentSum -= min
                    }
                }
                
                if heap.count == k {
                    let newMax = currentSum * pair[i].1
                    if max < newMax {
                        max = newMax
                    }
                }
            }
            
            return max
        }
        
    }
}
/*
 class Solution {
     func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
         let n = nums1.count
         
         let pair = zip(nums1, nums2).sorted { $0.1 > $1.1 }
         
         var max = 0
         var currentSum = 0
         var heap: Heap<Int> = .init()
         
         for i in 0..<k {
             
             let val = pair[i].0
             heap.insert(val)
             currentSum += val
             
             if heap.count > k {
                 if let min = heap.popMin() {
                     currentSum -= min
                 }
             }
             
             if heap.count == k {
                 let newMax = currentSum * pair[i].1
                 if max < newMax && heap.count == k {
                     max = newMax
                 }
             }
             
         }
         
         return max
     }
 }
 */
