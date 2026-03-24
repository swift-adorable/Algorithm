//
//  2390. Removing Stars From a String.swift
//  Algorithm
//
//  Created by 이정호 on 3/24/26.
//

import Foundation

extension LeetCode75 {
    class RemovingStarsFromAString {
        func removeStars(_ s: String) -> String {
            var buf = [Character]()
            
            // MARK: 참조 Method Description/Memory Optimization/reserveCapacity.md
            buf.reserveCapacity(s.count)
            
            for c in s {
                if c == "*" {
                    buf.removeLast()
                } else {
                    buf.append(c)
                }
            }
            
            return String(buf)
        }
    }
}
