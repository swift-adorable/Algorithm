//
//  1657. Determine if Two Strings Are Close.swift
//  Algorithm
//
//  Created by 이정호 on 3/19/26.
//

import Foundation

extension LeetCode75 {
    class DetermineIfTwoStringsAreClose {
        func closeStrings(_ word1: String, _ word2: String) -> Bool {
            guard word1.count == word2.count else { return false }
            
            var dict1 = [Character: Int]()
            var dict2 = [Character: Int]()
            
            for char in word1 { dict1[char, default: 0] += 1 }
            for char in word2 { dict2[char, default: 0] += 1 }
            
            guard Set(dict1.keys) == Set(dict2.keys) else { return false }
            
            return dict1.values.sorted() == dict2.values.sorted()
        }
    }
}
