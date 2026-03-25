//
//  394. Decode String.swift
//  Algorithm
//
//  Created by 이정호 on 3/24/26.
//

import Foundation

extension LeetCode75 {
    class DecodeString {
        func decodeString(_ s: String) -> String {
            var buffer: [(subString: String, repeat: Int)] = []
            var subString = ""
            var k = 0
            
            for char in s {
                
                if char.isNumber {
                    k = k * 10 + Int(String(char))!
                    
                } else if char == "[" {
                    buffer.append((subString, k))
                    subString = ""
                    k = 0
                    
                } else if char == "]" && buffer.isEmpty == false {
                    let last = buffer.removeLast()
                    subString = last.subString + String(repeating: subString, count: last.repeat)
                    
                } else {
                    subString.append(char)
                }
                
            }
            
            return subString
        }
        
    }
}
