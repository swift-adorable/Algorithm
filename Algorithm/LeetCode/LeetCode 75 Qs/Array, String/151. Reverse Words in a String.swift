//
//  151. Reverse Words in a String.swift
//  Algorithm
//
//  Created by 이정호 on 3/12/26.
//

import Foundation

extension LeetCode75 {
    class ReverseWordsInAString {
        func reverseWords(_ s: String) -> String {
//            var words = s.components(separatedBy: " ")
//            words.reverse()
//            words.removeAll(where: { $0.isEmpty })
//            return words.joined(separator: " ")
            
            // 1. split을 사용하여 공백을 기준으로 나누되, 빈 시퀀스는 자동으로 제외
            // 2. [Substring] 상태에서 바로 reverse 수행 (메모리 효율적)
            let words = s.split(separator: " ").reversed()
            
            // 3. 다시 하나의 문자열로 결합
            return words.joined(separator: " ")
        }
    }
}
