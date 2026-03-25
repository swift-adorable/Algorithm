//
//  933. Number of Recent Calls.swift
//  Algorithm
//
//  Created by 이정호 on 3/25/26.
//

import Foundation

extension LeetCode75 {
    
    class RecentCounter {
        
        private var queue: [Int] = []
        private var headIndex = 0

        init() { }

        func ping(_ t: Int) -> Int {

            queue.append(t)
            
            let minRange = t - 3000
            
            while headIndex < queue.count && queue[headIndex] < minRange {
                headIndex += 1
            }
            
            return queue.count - headIndex
        }
        
        /// Deque 사용 풀이
        /*
         import DequeModule // Apple의 Swift Collections 라이브러리
         // 내부 저장소로 Deque 사용
         private var deque = Deque<Int>()

         init() {}

         func ping(_ t: Int) -> Int {
             // 1. 새로운 호출 추가 (뒤에서 삽입: O(1))
             deque.append(t)
             
             let minRange = t - 3000
             
             // 2. 범위를 벗어난 데이터 삭제 (앞에서 제거: O(1))
             // Array와 달리 removeFirst()가 매우 빠릅니다.
             while let first = deque.first, first < minRange {
                 deque.removeFirst()
             }
             
             // 3. 현재 남은 요소의 개수 반환
             return deque.count
         }
         */
    }
    
    /**
     * Your RecentCounter object will be instantiated and called as such:
     * let obj = RecentCounter()
     * let ret_1: Int = obj.ping(t)
     */
}
