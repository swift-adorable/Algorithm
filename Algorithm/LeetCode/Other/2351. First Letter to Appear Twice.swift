//
//  2351. First Letter to Appear Twice.swift
//  Algorithm
//
//  Created by 이정호 on 10/22/24.
//

/*
 Given a string 's' consisting of lowercase English letters,
 return the first letter to appear twice.

 Note:

 A letter 'a' appears twice before another letter 'b' if the second occurrence of a is before the second occurrence of 'b'.
 's' will contain at least one letter that appears twice.

 Example 1:

 Input: s = "abccbaacz"
 Output: "c"
 Explanation:
 The letter 'a' appears on the indexes 0, 5 and 6.
 The letter 'b' appears on the indexes 1 and 4.
 The letter 'c' appears on the indexes 2, 3 and 7.
 The letter 'z' appears on the index 8.
 The letter 'c' is the first letter to appear twice, because out of all the letters the index of its second occurrence is the smallest.
 Example 2:

 Input: s = "abcdd"
 Output: "d"
 Explanation:
 The only letter that appears twice is 'd' so we return 'd'.
  

 Constraints:

 2 <= s.length <= 100
 s consists of lowercase English letters.
 s has at least one repeated letter.
 */

import Foundation

extension LeetCode {
    
    final class FirstLetterToAppearTwice {
        
        func repeatedCharacter(_ s: String) -> Character {
            
            var dict: [Character: Int] = [:]
            for char in Array(s) {
                if dict[char] == nil {
                    dict[char] = 0
                }
                dict[char]! += 1
                if dict[char] == 2 {
                    return char
                }
            }
            return Character("")
        }
        
    }
    
}
