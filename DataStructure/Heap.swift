//
//  Heap.swift
//  Algorithm
//
//  Created by μ΄μ νΈ on 2022/09/07.
//

//MARK: Heap π
/*
 Heap μ΄λβοΈ
 - μμ  μ΄μ§νΈλ¦¬μ μΌμ’μΌλ‘ μ°μ μμ νλ₯Ό μν΄ λ§λ€μ΄μ§ μλ£κ΅¬μ‘°.
 - μ€λ³΅λ κ°μ νμ©νλ€. (μ΄μ§ νμ νΈλ¦¬μμλ μ€λ³΅λ κ° νμ©νμ§ μμ.)
 - μ΄μ§ νΈλ¦¬μ ννλ‘ κ΅¬νλμκΈ° λλ¬Έμ μ½μκ³Ό μ­μ μ μκ°λ³΅μ‘λλ O(log(N))
 - ν€ κ°μ λμκ΄κ³λ μ€λ‘μ§ λΆλͺ¨ λΈλμ μμ λΈλ κ°μλ§ μ±λ¦½νλ©°, νΉν νμ  μ¬μ΄μλ λμκ΄κ³κ° μ ν΄μ§μ§ μλλ€.
 
    - Heapμ μ’λ₯
        - Max Heap: λΆλͺ¨ λΈλμ ν€ κ°μ΄ μμ λΈλμ ν€ κ°λ³΄λ€ ν¬κ±°λ κ°μ μμ  μ΄μ§νΈλ¦¬
            
        - Min Heap: λΆλͺ¨ λΈλμ ν€ κ°μ΄ μμ λΈλμ ν€ κ°λ³΄λ€ μκ±°λ κ°μ μμ  μ΄μ§νΈλ¦¬
 
 */

import Foundation

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
