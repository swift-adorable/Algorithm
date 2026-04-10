//
//  2516. Take K of Each Character From Left and Right.swift
//  Algorithm
//
//  Created by 이정호 on 10/21/24.
//

import Foundation

/*
 You are given a string s consisting of the characters 'a', 'b', and 'c' and a non-negative integer k. 
 Each minute, you may take either the leftmost character of s, or the rightmost character of s.

 Return the minimum number of minutes needed for you to take at least k of each character, 
 or return -1 if it is not possible to take k of each character.

 Example 1:

  - Input: s = "aabaaaacaabc", k = 2
  - Output: 8
  - Explanation:
   - Take three characters from the left of s. You now have two 'a' characters, and one 'b' character.
   - Take five characters from the right of s. You now have four 'a' characters, two 'b' characters, and two 'c' characters.
   - A total of 3 + 5 = 8 minutes is needed.
   - It can be proven that 8 is the minimum number of minutes needed.
 
 Example 2:

 Input: s = "a", k = 1
 Output: -1
 Explanation: It is not possible to take one 'b' or 'c' so return -1.
  

 Constraints:

 1 <= s.length <= 10^5
 s consists of only the letters 'a', 'b', and 'c'.
 0 <= k <= s.length
 */

extension LeetCode {
    class TakeKOfEachCharacterFromLeftAndRight {
        
        func takeCharacters(_ s: String, _ k: Int) -> Int {
                    
            var minutes = Int.max
            
            var sumA = 0
            var sumB = 0
            var sumC = 0
            
            let strArray = Array(s)
            let n = strArray.count
            
            if k == 0 { return 0 }
            if strArray.filter({ $0 == "a" }).count < k || strArray.filter({ $0 == "b" }).count < k || strArray.filter({ $0 == "c" }).count < k {
                return -1
            }
            
            for leftIdx in -1..<n {
                
                sumA = 0
                sumB = 0
                sumC = 0
                
                if leftIdx != -1 {
                    for bufferIdx in 0...leftIdx {
                        if isDoneTakeCharacters(a: sumA, b: sumB, c: sumC, k: k) {
                            let sum = sumA + sumB + sumC
                            minutes = min(sum, minutes)
                            break
                        }
                        
                        let char = strArray[bufferIdx]
                        if char == "a" {
                            sumA += 1
                        } else if char == "b" {
                            sumB += 1
                        } else if char == "c" {
                            sumC += 1
                        }
                    }
                }
                                
                let lastIndex = leftIdx == -1 ? 0 : leftIdx
                
                for rightIdx in stride(from: n-1, through: lastIndex, by: -1) {
                    
                    if isDoneTakeCharacters(a: sumA, b: sumB, c: sumC, k: k) {
                        let sum = sumA + sumB + sumC
                        minutes = min(sum, minutes)
                        break
                    }
                    
                    let char = strArray[rightIdx]
                    if char == "a" {
                        sumA += 1
                    } else if char == "b" {
                        sumB += 1
                    } else if char == "c" {
                        sumC += 1
                    }
                                        
                }
                
            }
            
            return minutes == Int.max ? -1 : minutes
            
        }
        
        private func isDoneTakeCharacters(a: Int, b: Int, c: Int, k: Int) -> Bool {
            return a >= k && b >= k && c >= k
        }
        
    }
    
}
