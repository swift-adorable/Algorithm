//
//  1207. Unique Number of Occurrences.swift
//  Algorithm
//
//  Created by 이정호 on 3/19/26.
//

import Foundation

extension LeetCode75 {
    class UniqueNumberOfOccurrences {
        func uniqueOccurrences(_ arr: [Int]) -> Bool {
            let values = Dictionary(grouping: arr, by: { $0 }).map({ $0.value.count }).sorted()
            var buf: [Int] = []
            for v in values {
                if buf.contains(v) {
                    return false
                }
                buf.append(v)
            }
            return true
        }
    }
}
