//
//  693. Binary Number with Alternating Bits.swift
//  Algorithm
//
//  Created by 이정호 on 11/18/24.
//

import Foundation

/*
 Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.

 Example 1:
  - Input: n = 5
  - Output: true
  - Explanation: The binary representation of 5 is: 101
 
 Example 2:
  - Input: n = 7
  - Output: false
  - Explanation: The binary representation of 7 is: 111.
 
 Example 3:
  - Input: n = 11
  - Output: false
  - Explanation: The binary representation of 11 is: 1011.

 2 11
 2  5 1
 2  2 1
 2  1 0
 
 Constraints:
  - 1 <= n <= 2^31 - 1
 */

/*
 var value = 100
 var result = ""

 result = String(value,radix: 2)

 print(result)
 //결과 : 1100100
 위와 같이 결과가 String으로 반환되는데, radix : 2로 설정해주면 integer 변수의 값이 2진수의 문자열로 반환됩니다.

 2진수를 10진수로 바꾸기
 var value = "1100100"
 var result : Int = Int(value,radix: 2)!

 print(result)
 //결과 : 100
 2진수를 10진수로 바꾸는 방법은, String 형태의 2진수여야 하고, 10진수는 Int형이므로 Int로 받아야 합니다!
 Int(value,radix: 2)! 에서 !는 value의 문자열이 숫자로 변환되지 않을 때 nil을 반환할 수도 있기 때문에 적어줘야 합니다!
 */
extension LeetCode {
    
    class BinaryNumberwithAlternatingBits {
        func hasAlternatingBits(_ n: Int) -> Bool {
            
            var bufferN = n
            var prevBit = bufferN % 2
            
            if n <= 2 { return true }
            
            while bufferN > 1 {
                let mod = bufferN % 2
                bufferN /= 2
                
                if prevBit == mod {
                    return false
                }
                prevBit = mod
            }
            
            return true
        }
        
    }
    
}
