//
//  466. Count The Repetitions.swift
//  Algorithm
//
//  Created by 이정호 on 10/15/24.
//

import Foundation

/*
 We define str = [s, n] as the string str which consists of the string s concatenated n times.

 For example, str == ["abc", 3] =="abcabcabc".
 We define that string s1 can be obtained from string s2 if we can remove some characters from s2 such that it becomes s1.

 For example, s1 = "abc" can be obtained from s2 = "abdbec" based on our definition by removing the bolded underlined characters("bde").
 You are given two strings s1 and s2 and two integers n1 and n2. You have the two strings str1 = [s1, n1] and str2 = [s2, n2].

 Return the maximum integer m such that str = [str2, m] can be obtained from str1.

 Example 1:

 Input: s1 = "acb", n1 = 4, s2 = "ab", n2 = 2
 str1 = "acbacbacbacb"
 str2 = "abab"
 Output: 2
 
 Example 2:

 Input: s1 = "acb", n1 = 1, s2 = "acb", n2 = 1
 Output: 1
  

 Constraints:

 1 <= s1.length, s2.length <= 100
 s1 and s2 consist of lowercase English letters.
 1 <= n1, n2 <= 10^6
 */

extension LeetCode {
    
    class CountTheRepetitions {
        func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
            
            let s1Array = Array(s1)
            let s2Array = Array(s2)
            var indexS2 = 0
            var countS2 = 0
            
            // s1을 n1번 반복하며 s2가 몇 번 완전히 등장하는지 확인
            for _ in 0..<n1 {
                for char in s1Array {
                    // s1의 문자가 s2와 일치할 경우 인덱스를 증가시킴
                    if char == s2Array[indexS2] {
                        indexS2 += 1
                        // s2 전체가 일치했을 경우
                        if indexS2 == s2Array.count {
                            indexS2 = 0
                            countS2 += 1
                        }
                    }
                }
            }
            
            // s2가 몇 번 등장했는지 계산 후 n2로 나누어 반환
            return countS2 / n2
        }
    }
    
}
