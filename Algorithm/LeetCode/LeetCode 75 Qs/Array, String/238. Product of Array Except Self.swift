//
//  238. Product of Array Except Self.swift
//  Algorithm
//
//  Created by 이정호 on 3/12/26.
//

import Foundation

extension LeetCode75 {
    class ProductOfArrayExceptSelf {
        
        func productExceptSelf(_ nums: [Int]) -> [Int] {
            let nCount = nums.count
            var result = Array(repeating: 1, count: nCount)
            
            for i in 1..<nCount {
                let n = nums[i - 1]
                let r = result[i - 1]
                result[i] = n * r
            }
            
            var buf = 1
            for i in (0..<nCount).reversed() {
                let r = result[i]
                let value = r * buf
                result[i] = value
                buf *= nums[i]
            }
            
            return result
        }
    }
}
