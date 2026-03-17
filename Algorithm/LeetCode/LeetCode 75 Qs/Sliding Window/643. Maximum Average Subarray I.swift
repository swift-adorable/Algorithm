//
//  643. Maximum Average Subarray I.swift
//  Algorithm
//
//  Created by 이정호 on 3/17/26.
//

import Foundation

extension LeetCode75 {
    class MaximumAverageSubarrayI {
        func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
            var sum = nums.prefix(k).reduce(0, +)
            var maxSum = sum
            
            for i in k..<nums.count {
                sum += nums[i] - nums[i-k]
                maxSum = max(sum, maxSum)
            }
            
            return Double(maxSum) / Double(k)
        }
    }
}
