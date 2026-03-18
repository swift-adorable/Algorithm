//
//  1732. Find the Highest Altitude.swift
//  Algorithm
//
//  Created by 이정호 on 3/18/26.
//

import Foundation

extension LeetCode75 {
    class FindTheHighestAltitude {
        func largestAltitude(_ gain: [Int]) -> Int {
            var sum = 0
            var maxSum = 0
            for i in 0..<gain.count {
                sum += gain[i]
                if maxSum < sum { maxSum = sum }
            }
            return maxSum
        }
    }
}
