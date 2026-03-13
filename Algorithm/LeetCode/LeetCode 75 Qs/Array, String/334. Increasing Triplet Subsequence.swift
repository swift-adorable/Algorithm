//
//  334. Increasing Triplet Subsequence.swift
//  Algorithm
//
//  Created by 이정호 on 3/13/26.
//

import Foundation

extension LeetCode75 {
    class IncreasingTripletSubsequence {
        func increasingTriplet(_ nums: [Int]) -> Bool {
            var (min, mid) = (Int.max, Int.max)
            
            for num in nums {
                if num <= min {
                    min = num
                } else if num <= mid {
                    mid = num
                } else {
                    return true
                }
            }
            
            return false
        }
    }
}
