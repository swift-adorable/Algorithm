//
//  1493. Longest Subarray of 1's After Deleting One Element.swift
//  Algorithm
//
//  Created by 이정호 on 3/18/26.
//

import Foundation

extension LeetCode75 {
    class LongestSubarrayOf1sAfterDeletingOneElement {
        func longestSubarray(_ nums: [Int]) -> Int {
            var left = 0
            var zeroCount = 0
            var maxCount = 0
            
            for right in 0..<nums.count {
                if nums[right] == 0 {
                    zeroCount += 1
                    
                    while zeroCount > 1 {
                        if nums[left] == 0 {
                            zeroCount -= 1
                        }
                        left += 1
                    }
                    
                }
                let count = right - left
                if maxCount < count { maxCount = count }
            }
            
            return maxCount
        }
    }
}
