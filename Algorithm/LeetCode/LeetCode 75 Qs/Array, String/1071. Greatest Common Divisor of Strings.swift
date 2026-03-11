//
//  1071. Greatest Common Divisor of Strings.swift
//  Algorithm
//
//  Created by 이정호 on 3/10/26.
//

import Foundation

extension LeetCode75 {
    class GreatestCommonDivisorOfStrings {
        func gcdOfStrings(_ str1: String, _ str2: String) -> String {
                // 1. 문자열 결합 순서에 따른 일치 여부 확인 (기본 조건)
                guard str1 + str2 == str2 + str1 else {
                    return ""
                }
                
                // 2. 두 문자열 길이의 최대공약수(GCD) 계산
                let gcdLength = gcd(str1.count, str2.count)
                
                // 3. GCD 길이만큼의 접두사 반환
                return String(str1.prefix(gcdLength))
            }
            
            // 유클리드 호제법을 이용한 GCD 계산 함수
            private func gcd(_ a: Int, _ b: Int) -> Int {
                var a = a
                var b = b
                while b != 0 {
                    let temp = a % b
                    print("temp: \(temp)")
                    a = b
                    b = temp
                    print("a: \(a), b: \(b)")
                }
                return a
            }
    }
}
