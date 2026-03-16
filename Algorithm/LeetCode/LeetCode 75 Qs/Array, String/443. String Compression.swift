//
//  443. String Compression.swift
//  Algorithm
//
//  Created by 이정호 on 3/13/26.
//

import Foundation

extension LeetCode75 {
    class StringCompression {
        func compress(_ chars: inout [Character]) -> Int {
                        
            var (read, write) = (0, 0)
            
            while read < chars.count {
                
                let char = chars[read]
                var count: Int = 0
                
                while read < chars.count && chars[read] == char {
                    read += 1
                    count += 1
                }
                
                chars[write] = char
                write += 1
                
                if count > 1 {
                    for c in String(count) {
                        chars[write] = c
                        write += 1
                    }
                }

            }
            
            return write
        }
    }
}
