//
//  283. Move Zeroes.swift
//  Algorithm
//
//  Created by 이정호 on 3/16/26.
//

import Foundation

extension LeetCode75 {
    class MoveZeroes {
        func moveZeroes(_ nums: inout [Int]) {
            func moveZeroes(_ nums: inout [Int]) {
                let nCount = nums.count
                guard nCount > 1 else { return }
                
                var write = 0
                
                for read in 0..<nCount {
                    if nums[read] != 0 {
                        if read != write {
                            nums.swapAt(write, read)
                        }
                        write += 1
                    }
                }
            }
        }
    }
}
