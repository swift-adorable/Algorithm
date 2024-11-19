//
//  2514. Count Anagrams.swift
//  Algorithm
//
//  Created by 이정호 on 10/23/24.
//

import Foundation

/*
 You are given a string s containing one or more words. Every consecutive pair of words is separated by a single space ' '.

 A string 't' is an anagram of string 's' if the 'i^th' word of 't' is a permutation of the ith word of 's'.

 For example, "acb dfe" is an anagram of "abc def", but "def cab" and "adc bef" are not.
 Return the number of distinct anagrams of 's'. Since the answer may be very large, return it modulo 10^9 + 7.

 Example 1:

  - Input: s = "too hot"
  - Output: 18
  - Explanation: 
     Some of the anagrams of the given string are "too hot", "oot hot", "oto toh", "too toh", and "too oht".
 
 Example 2:

  - Input: s = "aa"
  - Output: 1
  - Explanation: There is only one anagram possible for the given string.
  

 Constraints:

 1 <= s.length <= 10^5
 's' consists of lowercase English letters and spaces ' '.
 There is single space between consecutive words.
 
 Hint 1
  - For each word, can you count the number of permutations possible if all characters are distinct?
 Hint 2
  - How to reduce overcounting when letters are repeated?
 Hint 3
  - The product of the counts of distinct permutations of all words will give the final answer.
 */

extension LeetCode {
    
    final class CountAnagrams {
            
        func countAnagrams(_ s: String) -> Int {
            
            let MOD = LeetCode.MOD
            
            let sliceArray = s.components(separatedBy: " ")
            
            let total = sliceArray.map { str -> Int in
                var total = factorial(str.count)
                
                var bufferDict: [Character: Int] = [:]
                let arrayStr = Array(str)
                
                arrayStr.forEach {
                    bufferDict[$0, default: 0] += 1
                }
                
                bufferDict.forEach {
                    // 모듈러 역원 사용
                    total = (total * modInverse(factorial($0.value), MOD)) % MOD
                }
                
                return total
            }.reduce(1) {
                return ($0 * $1) % MOD
            }
            
            return total
        }
        
        private func factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result = (result * i) % MOD
            }
            return result
        }
        
        // 모듈러 역원 계산 함수 (페르마의 소정리 이용)
        private func modInverse(_ a: Int, _ m: Int) -> Int {
            return powMod(a, m - 2, m)
        }
        
        // 빠른 거듭제곱을 이용한 모듈러 연산
        private func powMod(_ base: Int, _ exp: Int, _ mod: Int) -> Int {
            var result = 1
            var base = base % mod
            var exp = exp
            
            while exp > 0 {
                if exp % 2 == 1 {
                    result = (result * base) % mod
                }
                base = (base * base) % mod
                exp /= 2
            }
            
            return result
        }
    
//         private let MOD = 1_000_000_007
//            
//         func countAnagrams(_ s: String) -> Int {
//             let sliceArray = s.components(separatedBy: " ")
//            
//             let total = sliceArray.map { str -> Int in
//                 var total = factorial(str.count)
//                
//                 var bufferDict: [Character: Int] = [:]
//                 let arrayStr = Array(str)
//                
//                 arrayStr.forEach {
//                     bufferDict[$0, default: 0] += 1
//                 }
//                
//                 bufferDict.forEach {
//                     total /= factorial($0.value)
//                     total %= MOD
//                 }
//                
//                 return total
//             }.reduce(1) {
//                 return ($0 * $1) % MOD
//             }
//            
//             return total
//            
//         }
//        
//         private func factorial(_ n: Int, _ mul: Int = 1) -> Int {
//             let buffer = n - 1
//             guard buffer > 0 else {
//                 return mul
//             }
//             return factorial(buffer, mul * n % MOD)
//         }
        
    }
    
}
