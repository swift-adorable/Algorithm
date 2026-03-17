//
//  1004. Max Consecutive Ones III.swift
//  Algorithm
//
//  Created by 이정호 on 3/17/26.
//

import Foundation

extension LeetCode75 {
    class MaxConsecutiveOnesIII {
        func longestOnes(_ nums: [Int], _ k: Int) -> Int {
            
            var left = 0
            var zeroCount = 0
            var maxCount = 0
            
            for right in 0..<nums.count {

                if nums[right] == 0 {
                    zeroCount += 1
                    
                    if zeroCount > k {
                        if nums[left] == 0 {
                            zeroCount -= 1
                        }
                        left += 1
                    }
                }

                let count = right - left + 1
                if maxCount < count { maxCount = count }
                
            }
            return maxCount
        }
    }
}
