//
//  2336. Smallest Number in Infinite Set.swift
//  Algorithm
//
//  Created by 이정호 on 7/6/26.
//

import Foundation

extension LeetCode75 {
    class SmallestInfiniteSet {
        
        private var nextSmallestInteger = 1
        private var heap: Heap<Int>
        // Heap 탐색 속도 최적화(O(1)) 및 중복 방지를 위한 추적 집합
        private var isPresentInHeap = Set<Int>()
        
        init() {
            self.heap = Heap<Int>(comparer: <)
        }
        
        func popSmallest() -> Int {
            // 1. 힙에 복귀한 예외적인 숫자가 있다면 우선적으로 추출
            if let smallestFromHeap = heap.pop() {
                isPresentInHeap.remove(smallestFromHeap)
                return smallestFromHeap
            }
            
            // 2. 힙이 비어 있다면 현재 연속 구간의 시작점 반환 후 포인터 증가
            let smallestInteger = nextSmallestInteger
            nextSmallestInteger += 1
            return smallestInteger
        }
        
        func addBack(_ num: Int) {
            // 가드 조건 1: 아직 꺼낸 적도 없는(이미 집합에 존재하는) 숫자는 무시
            guard num < nextSmallestInteger else { return }
            
            // 가드 조건 2: 이미 힙에서 대기 중인 중복 숫자는 무시
            guard !isPresentInHeap.contains(num) else { return }
            
            // 검증 완료된 유실 데이터만 힙과 집합에 동시 추가
            heap.insert(num)
            isPresentInHeap.insert(num)
        }
    }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * let obj = SmallestInfiniteSet()
 * let ret_1: Int = obj.popSmallest()
 * obj.addBack(num)
 */
