//
//  1768. Merge Strings Alternately.swift
//  Algorithm
//
//  Created by 이정호 on 3/10/26.
//

import Foundation

extension LeetCode75 {
    class MergeStringsAlternately {
        func mergeAlternately(_ word1: String, _ word2: String) -> String {
            let arr1 = word1.map { String($0) }
            let arr2 = word2.map { String($0) }
            
            let maxLength = max(arr1.count, arr2.count)
            
            var results: String = ""
            for i in 0..<maxLength {
                if arr1.count > i { results += arr1[i] }
                if arr2.count > i { results += arr2[i] }
            }
            
            return results
        }
    }
}
