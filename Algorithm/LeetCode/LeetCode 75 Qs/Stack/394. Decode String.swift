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
            var characters = s.map { $0 }
            var decodedString: String = ""
            var currentNumber: Int = 0
            
            for idx in 0..<characters.count {
                
                let char = characters[idx]
                
                if char == "]" { continue }
                
                if char.isNumber {
                    let decoded = decoded(&characters)
                    decodedString.append(decoded)
                    continue
                }
                
                decodedString.append(char)
            }
            
            return decodedString
        }
        
        func decoded(_ chars: inout [Character]) -> String {
            
//            if char.isNumber {
//                currentNumber = char.wholeNumberValue ?? 0
//                continue
//            }
//            
//            if char == "[" {
//                var buffer = ""
//                var idx = idx+1
//                while characters[idx] != "]" {
//                    buffer.append(characters[idx])
//                    characters[idx] = "]"
//                    idx += 1
//                }
//                for _ in 0..<currentNumber {
//                    decodedString += buffer
//                }
//                continue
//            }
            
        }
    }
}
