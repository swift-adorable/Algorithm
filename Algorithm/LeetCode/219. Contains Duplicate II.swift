//
//  219. Contains Duplicate II.swift
//  Algorithm
//
//  Created by 이정호 on 11/12/24.
//

import Foundation

/*
 Given an integer array `nums` and an integer `k`,
 return `true` if there are two distinct indices `i` and `j` in the array such that `nums[i] == nums[j]` and `abs(i - j) <= k`.

 Example 1:
  - Input: nums = [1,2,3,1], k = 3
  - Output: true
 
 Example 2:
  - Input: nums = [1,0,1,1], k = 1
  - Output: true
 
 Example 3:
  - Input: nums = [1,2,3,1,2,3], k = 2
  - Output: false


 Constraints:
  1 <= nums.length <= 10^5
  -10^9 <= nums[i] <= 10^9
  0 <= k <= 10^5
 */

extension LeetCode {
    
    class ContainsDuplicateII {
        
        func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
            let n = nums.count
            
            var value = false
            
            if n == 2 && k >= 1 && nums[0] == nums[1] {
                return true
            }
            
            guard n > 1, n >= k else {
                return false
            }
            
            for i in 0 ..< n {
                
                if value { break }
                
                for j in i+1 ..< min(i+1+k, n) {
                    if nums[i] == nums[j] && abs(i-j) <= k {
                        value = true
                        break
                    }
                }
            }
            
            return value
            
        }
        
        /*
         //HashMap 을 활용한 Solution
         func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
             guard !nums.isEmpty else { return false }
             var dict: [Int: Int] = [:]
             
             for (index, value) in nums.enumerated() {
                 if let elem = dict[value], abs(index - elem) <= k {
                     return true
                 }
                 dict[value] = index
             }
             
             return false
         }
         */
    }
    
}
