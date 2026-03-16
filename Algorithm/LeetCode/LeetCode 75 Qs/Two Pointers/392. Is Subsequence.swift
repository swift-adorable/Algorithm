//
//  392. Is Subsequence.swift
//  Algorithm
//
//  Created by 이정호 on 3/16/26.
//

import Foundation

extension LeetCode75 {
    class IsSubsequence {
        func isSubsequence(_ s: String, _ t: String) -> Bool {
            
            if s.isEmpty { return true }
            
            guard s.count < t.count else { return false }
            
            var sIndex = s.startIndex
            var tIndex = t.startIndex
            
            while sIndex < s.endIndex && tIndex < t.endIndex {
                if s[sIndex] == t[tIndex] {
                    sIndex = s.index(after: sIndex)
                    tIndex = t.index(after: tIndex)
                    if sIndex == s.endIndex { return true }
                } else {
                    tIndex = t.index(after: tIndex)
                }
            }
            return false
        }
    }
}
