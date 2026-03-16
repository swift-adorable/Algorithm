//
//  1679. Max Number of K-Sum Pairs.swift
//  Algorithm
//
//  Created by 이정호 on 3/16/26.
//

import Foundation

extension LeetCode75 {
    class MaxNumberOfK_SumPairs {
        func maxOperations(_ nums: [Int], _ k: Int) -> Int {
            guard nums.count > 2 else {
                return (nums.reduce(0, +) == k) ? 1 : 0
            }
            var count = 0
            let sortedNums = nums.sorted(by: { $0 < $1 })
            
            var left = 0
            var right = sortedNums.count - 1
            
            while left < right {
                let sum = sortedNums[left] + sortedNums[right]
                if sum == k {
                    count += 1
                    left += 1
                    right -= 1
                } else if sum < k {
                    left += 1
                } else {
                    right -= 1
                }
            }
            
            return count
        }
    }
}
