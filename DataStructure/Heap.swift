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

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.count == 1
    }
    
    var peek: T? {
        if self.isEmpty { return nil }
        return self.elements.last!
    }
    
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFunction = sortFunction
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    func parent(of index: Int) -> Int {
        return (index) / 2
    }
    
    mutating func add(element: T) {
        self.elements.append(element)
    }
    
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    
    mutating func swimUp(from index: Int) {
        var index = index
        while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
            self.elements.swapAt(index, self.parent(of: index))
            index = self.parent(of: index)
        }
    }
    
    mutating func buildHeap() {
        for index in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    
    mutating func insert(node: T) {
        if self.elements.isEmpty {
            self.elements.append(node)
        }
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    
    mutating func remove() -> T? {
        if self.isEmpty { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
    
}
