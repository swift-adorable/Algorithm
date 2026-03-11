//
//  Remove Duplicates from Sorted Array.swift
//  Algorithm
//
//  Created by 이정호 on 6/11/25.
//

import Foundation

extension TopInterviewQuestions_Easy {
    
    class RemoveDuplicatesFromSortedArray {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            nums = Array(Set(nums)).sorted(by: { $0 < $1 })
            return nums.count
        }
    }
    
}
