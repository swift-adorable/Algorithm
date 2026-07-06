//
//  Heap.swift
//  Algorithm
//
//  Created by 이정호 on 2022/09/07.
//

import Foundation

/**
 🔖 Heap 이란⁉️
 - 완전 이진트리의 일종으로 우선순위 큐를 위해 만들어진 자료구조.
 - 중복된 값을 허용한다. (이진 탐색 트리에서는 중복된 값 허용하지 않음.)
 - 이진 트리의 형태로 구현되었기 때문에 삽입과 삭제의 시간복잡도는 O(log(N))
 - 키 값의 대소관계는 오로지 부모 노드와 자식 노드 간에만 성립하며, 특히 형제 사이에는 대소관계가 정해지지 않는다.
 
    - Heap의 종류
        - Max Heap: 부모 노드의 키 값이 자식 노드의 키 값보다 크거나 같은 완전 이진트리
            
        - Min Heap: 부모 노드의 키 값이 자식 노드의 키 값보다 작거나 같은 완전 이진트리
 
 */

struct Heap<T> {
    private(set) var nodes: [T] = []
    private let comparer: (T, T) -> Bool

    var isEmpty: Bool { nodes.isEmpty }
    var count: Int { nodes.count }

    // comparer: (parent, child) -> Bool
    // 최소 힙: < , 최대 힙: >
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }

    /// 루트 노드
    func peek() -> T? {
        nodes.first
    }

    mutating func insert(_ element: T) {
        nodes.append(element)
        siftUp(from: nodes.count - 1)
    }

    /// 루트 노드 제거
    mutating func pop() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 { return nodes.removeFirst() }
        
        let result = nodes[0]
        nodes[0] = nodes.removeLast()
        siftDown(from: 0)
        
        return result
    }

    /// 삽입 시: 아래에서 위로 재배치 (Sift Up)
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && comparer(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    /// 삭제 시: 위에서 아래로 재배치 (Sift Down)
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = parent * 2 + 1
            let rightChild = parent * 2 + 2
            var candidate = parent
            
            if leftChild < nodes.count && comparer(nodes[leftChild], nodes[candidate]) {
                candidate = leftChild
            }
            
            if rightChild < nodes.count && comparer(nodes[rightChild], nodes[candidate]) {
                candidate = rightChild
            }
            
            if candidate == parent { return }
            
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
