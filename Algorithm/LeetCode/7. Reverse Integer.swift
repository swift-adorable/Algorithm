//
//  7. Reverse Integer.swift
//  Algorithm
//
//  Created by 이정호 on 10/11/24.
//

import Foundation

extension LeetCode {
    
    /*
     Given a signed 32-bit integer x,
     return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-2^31, 2^31 - 1], then return 0.
     Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

     Example 1:
        Input: x = 123, Output: 321
     Example 2:
        Input: x = -123, Output: -321
     Example 3:
        Input: x = 120, Output: 21
      
     Constraints: (-2^31) <= x <= (2^31 - 1)
     */
    
    class ReverseInteger {
        
        func reverse(_ x: Int) -> Int {
            let absX = abs(x)
            let isMinus = x < 0
            let strX = String(String(absX).reversed())
            guard let mappedX = Int(strX) else {
                print("absX: \(absX), strX: \(strX)")
                return absX
            }
            let reverseValue = isMinus ? -mappedX : mappedX
            
            return Int(Int32.max) < reverseValue || Int(Int32.min) > reverseValue ? 0 : reverseValue
        }
    }
    
}
