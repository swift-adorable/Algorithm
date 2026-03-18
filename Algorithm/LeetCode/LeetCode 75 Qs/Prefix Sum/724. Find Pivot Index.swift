//
//  724. Find Pivot Index.swift
//  Algorithm
//
//  Created by 이정호 on 3/18/26.
//

import Foundation

extension LeetCode75 {
    class FindPivotIndex {
        func pivotIndex(_ nums: [Int]) -> Int {
            guard nums.count > 1 else { return 0 }
            var leftSum = 0
            let totalSum = nums.reduce(0, +)
            for i in 0..<nums.count {
                if leftSum == (totalSum - leftSum - nums[i]) {
                    return i
                }
                leftSum += nums[i]
            }
            return -1
        }
    }
}
//print("leftSum: \(leftSum), totalSum: \(totalSum), nums[i]: \(nums[i])")
