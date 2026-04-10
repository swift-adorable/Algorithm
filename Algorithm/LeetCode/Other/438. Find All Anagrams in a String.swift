//
//  438. Find All Anagrams in a String.swift
//  Algorithm
//
//  Created by 이정호 on 11/19/24.
//

import Foundation

/*
 Given two strings `s` and `p`, return an array of all the start indices of p's
 anagrams in `s`. You may return the answer in any order.

 Example 1:

 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
  

 Constraints:

 1 <= s.length, p.length <= 3 * 10^4
 s and p consist of lowercase English letters.
 
 */

extension LeetCode {
    
    class FindAllAnagramsInAString {
        
        func findAnagrams(_ s: String, _ p: String) -> [Int] {
            let sArr = Array(s)
            let pArr = Array(p)
            var result = [Int]()
            
            guard sArr.count >= pArr.count else {
                return []
            }
            
            var pSlide = [Character: Int]()
            var windowSlide = [Character: Int]()
            
            pArr.forEach { pSlide[$0, default: 0] += 1 }
            
            for i in 0..<pArr.count {
                windowSlide[sArr[i], default: 0] += 1
            }
            
            if windowSlide == pSlide {
                result.append(0)
            }
            
            for i in pArr.count..<sArr.count {
                let startIndex = i - pArr.count
                
                windowSlide[sArr[startIndex], default: 0] -= 1

                if windowSlide[sArr[startIndex]] == 0 {
                    windowSlide.removeValue(forKey: sArr[startIndex])
                }
                
                windowSlide[sArr[i], default: 0] += 1
                
                if windowSlide == pSlide {
                    result.append(startIndex + 1)
                }
            }
            
            return result
        }
        
//        func findAnagrams(_ s: String, _ p: String) -> [Int] {
//            
//            let sCount = s.count
//            let pCount = p.count
//
//            guard sCount >= pCount else {
//                return []
//            }
//            
//            var arr: [Int] = []
//            
//            let sArr = Array(s)
//            
//            for i in 0...sCount-pCount {
//                
//                var pArr = Array(p)
//                
//                for j in 0..<pCount {
//                    let char = sArr[i+j]
//
//                    if pArr.contains(char) {
//                        
//                        if let pIdx = pArr.firstIndex(of: char) {
//                            pArr.remove(at: pIdx)
//                        }
//                        
//                        if j == pCount-1 {
//                            arr.append(i)
//                        }
//                        
//                    } else {
//                        break
//                    }
//                    
//                }
//                
//            }
//            
//            return arr
//            
//        }
        
    }
    
}
