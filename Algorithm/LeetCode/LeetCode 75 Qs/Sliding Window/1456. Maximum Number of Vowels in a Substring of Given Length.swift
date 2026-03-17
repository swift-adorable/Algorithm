//
//  1456. Maximum Number of Vowels in a Substring of Given Length.swift
//  Algorithm
//
//  Created by 이정호 on 3/17/26.
//

import Foundation

extension LeetCode75 {
    class MaximumNumberOfVowelsInASubstringOfGivenLength {
        func maxVowels(_ s: String, _ k: Int) -> Int {
            // 모음 여부를 판단하는 클로저 (내부에서만 사용)
            let isVowel: (Character) -> Bool = { char in
                switch char {
                case "a", "e", "i", "o", "u": return true
                default: return false
                }
            }
            
            let chars = Array(s)
            var count = 0
            for i in 0..<k {
                if isVowel(chars[i]) { count += 1 }
            }
            
            if count == k { return k }

            var maxCount = count
            
            for i in k..<chars.count {
                if isVowel(chars[i]) { count += 1 }
                if isVowel(chars[i - k]) { count -= 1}
                if count > maxCount { maxCount = count }
                if maxCount == k { return k }
            }
            
            return maxCount
        }
    }
}
