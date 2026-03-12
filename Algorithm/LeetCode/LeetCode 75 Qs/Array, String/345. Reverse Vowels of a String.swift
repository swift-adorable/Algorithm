//
//  345. Reverse Vowels of a String.swift
//  Algorithm
//
//  Created by 이정호 on 3/12/26.
//

import Foundation

extension LeetCode75 {
    /**
     주요 코드 리뷰 및 개선
     포인트데이터 타입 최적화 ([String] vs [Character]):
        현재 s.map { String($0) }을 통해 모든 문자를 String 객체로 변환하고 있습니다.
        Swift에서 String은 구조체이지만 내부에 힙(Heap) 메모리를 사용하는 무거운 타입입니다.
        문자 하나를 다룰 때는 Character 타입을 사용하는 것이 메모리 오버헤드를 줄이는 데 훨씬 유리합니다.
     탐색 효율성 (Array vs Set):
        vowels.contains() 호출 시, Array는 순차 탐색(O(k))을 수행합니다.
        모음의 개수가 적어 성능 차이가 미미할 수 있으나, 탐색에는 Set(O(1))을 사용하는 것이 자료구조 선택의 정석입니다.
     제어 흐름 단순화:
        중첩된 if문과 continue 대신, 내부에서 while 루프를 사용하여 포인터를 이동시키면 코드가 훨씬 직관적이고 가독성이 좋아집니다.
     */
    class ReverseVowelsOfAString {

        func reverseVowels(_ s: String) -> String {
            // 1. Set을 사용하여 O(1) 탐색 보장
            let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
            
            // 2. [String] 대신 [Character] 배열을 사용하여 메모리 사용량 최적화
            var chars = Array(s)
            var i = 0
            var j = chars.count - 1
            
            while i < j {
                // 왼쪽 포인터가 모음을 가리킬 때까지 이동
                while i < j && !vowels.contains(chars[i]) {
                    i += 1
                }
                
                // 오른쪽 포인터가 모음을 가리킬 때까지 이동
                while i < j && !vowels.contains(chars[j]) {
                    j -= 1
                }
                
                // 두 포인터가 모음을 가리키고 있다면 스왑 후 이동
                if i < j {
                    chars.swapAt(i, j)
                    i += 1
                    j -= 1
                }
            }
            
            // 3. Character 배열을 다시 String으로 변환 (O(n))
            return String(chars)
        }
        
        /*
         // 내 풀이
         func reverseVowels(_ s: String) -> String {
             let vowels = ["a", "e", "o", "i", "u", "A", "E", "O", "I", "U"]
             var array = s.map { String($0) }
             var i = 0
             var j = array.count - 1
             
             while i < j {
                 if vowels.contains(array[i]) {
                     if vowels.contains(array[j]) {
                         array.swapAt(i, j)
                         i += 1
                         j -= 1
                         continue
                     } else {
                         j -= 1
                         continue
                     }
                 } else {
                     i += 1
                 }
             }
             
             return array.joined()
         }
         */
        
    }
}
