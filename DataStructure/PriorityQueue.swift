//
//  PriorityQueue.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/18.
//

import Foundation

struct PriorityQueue<T> {
    private var heap: Heap<T>
    
    // 우선순위 결정 조건 (예: < 는 최소 힙, > 는 최대 힙)
    init(order: @escaping (T, T) -> Bool) {
        self.heap = Heap(comparer: order)
    }
    
    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    
    // 데이터 추가
    mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    // 우선순위가 가장 높은 데이터 추출
    mutating func dequeue() -> T? {
        return heap.pop()
    }
    
    // 확인만 하기
    func peek() -> T? {
        return heap.peek()
    }
}
