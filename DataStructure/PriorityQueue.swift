//
//  PriorityQueue.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/18.
//

import Foundation

struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
        heap = Heap(elements: elements, sortFunction: sort)
    }
    
    var count : Int {
        return heap.count
    }
    
    var isEmpty : Bool {
        return heap.isEmpty
    }
    
    func top () -> T? {
        return heap.peek
    }
    
    mutating func clear () {
        while !heap.isEmpty {
            _ = heap.remove()
        }
    }
    
    mutating func pop() -> T? {
        return heap.remove()
    }
    
    mutating func push(_ element: T) {
        heap.insert(node: element)
    }
    
}
