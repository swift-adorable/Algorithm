//
//  11. Container With Most Water.swift
//  Algorithm
//
//  Created by 이정호 on 3/16/26.
//

import Foundation

extension LeetCode75 {
    
    class ContainerWithMostWater {
        func maxArea(_ height: [Int]) -> Int {
            
            var result: Int = 0
            var left = 0
            var right = height.count-1
            
            while left < right {
                let area = min(height[left], height[right]) * (right - left)
                result = max(result, area)
                
                if height[left] < height[right] {
                    left += 1
                } else {
                    right -= 1
                }
            }
            
            return result
        }
    }
    
}
