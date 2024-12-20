//
//  3227. Vowels Game in a String.swift
//  Algorithm
//
//  Created by 이정호 on 11/20/24.
//

import Foundation

/*
 Alice and Bob are playing a game on a string.
 You are given a string `s`, Alice and Bob will take turns playing the following game where Alice starts first:

  - On Alice's turn, she has to remove any non-empty `substring` from `s` that contains an `odd` number of vowels.
  - On Bob's turn, he has to remove any non-empty `substring` from `s` that contains an `even` number of vowels.
 
 The first player who cannot make a move on their turn loses the game. 
 We assume that both Alice and Bob play optimally.
 Return `true` if Alice wins the game, and `false` otherwise.
 The English vowels are: `a`, `e`, `i`, `o`, and `u`.

 Example 1:

  - Input: s = "leetcoder"
  - Output: true
  - Explanation:
     Alice can win the game as follows:

     Alice plays first, she can delete the underlined substring in s = "leetcoder" which contains 3 vowels. 
     The resulting string is s = "der".
 
     Bob plays second, he can delete the underlined substring in s = "der" which contains 0 vowels.
     The resulting string is s = "er".
 
     Alice plays third, she can delete the whole string s = "er" which contains 1 vowel.
 
     Bob plays fourth, since the string is empty, there is no valid play for Bob. So Alice wins the game.
 
 Example 2:

  - Input: s = "bbcd"
  - Output: false
  - Explanation:
     There is no valid play for Alice in her first turn, so Alice loses the game.

 Constraints:
  - 1 <= s.length <= 10^5
  - s consists only of lowercase English letters.
 
 Hint 1
  - If there are no vowels in the initial string, then Bob wins.
 Hint 2
  - If the number of vowels in the initial string is odd, then Alice can remove the whole string on her first turn and win.
 Hint 3
  - What if the number of vowels in the initial string is even? What’s the optimal play for Alice’s first turn?

 
 */

extension LeetCode {
    
    class VowelsGameInAString {
        
        func doesAliceWin(_ s: String) -> Bool {
            
            return s.filter { ["a", "e", "i", "o", "u"].contains($0) }.count > 0
            
//            var sArr = Array(s)
//            
//            var hashMap = [Character: Int]()
//            
//            sArr.forEach { hashMap[$0, default: 0] += 1 }
//            
//            if ["a", "e", "i", "o", "u"].compactMap({ hashMap[$0] }).reduce(0, +) == 0 { return false }
//            
//            return true
            
        }
        
    }
    
    
}
