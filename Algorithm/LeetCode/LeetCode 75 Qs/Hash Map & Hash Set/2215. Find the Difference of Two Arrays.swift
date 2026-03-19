//
//  2215. Find the Difference of Two Arrays.swift
//  Algorithm
//
//  Created by 이정호 on 3/19/26.
//

import Foundation

extension LeetCode75 {
    class FindTheDifferenceOfTwoArrays {
        func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
            let nums1Set: Set<Int> = Set(nums1)
            let nums2Set: Set<Int> = Set(nums2)
            return [
                difference(nums1Set, nums2Set),
                difference(nums2Set, nums1Set)
            ]
        }
        
        private func difference(_ nums1: Set<Int>, _ nums2: Set<Int>) -> [Int] {
            return nums1.filter { !nums2.contains($0) }
//            var result: [Int] = []
//            for n2 in nums2 {
//                if !nums1.contains(n2) {
//                    result.append(n2)
//                }
//            }
//            return result.sorted()
        }
    }
}
