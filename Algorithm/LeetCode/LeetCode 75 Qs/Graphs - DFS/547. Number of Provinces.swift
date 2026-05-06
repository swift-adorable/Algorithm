//
//  547. Number of Provinces.swift
//  Algorithm
//
//  Created by 이정호 on 4/24/26.
//

import Foundation

extension LeetCode75 {
    class NumberOfProvinces {
        func findCircleNum(_ isConnected: [[Int]]) -> Int {
            let n = isConnected.count
            var visited: [Bool] = Array(repeating: false, count: n)
            var count = 0
        
            for i in 0..<n {
                if !visited[i] {
                    dfs(isConnected, &visited, i)
                    count += 1
                }
            }
            
            return count
        }
        
        func dfs(_ isConnected: [[Int]], _ visited: inout [Bool], _ idx: Int) {
            visited[idx] = true
            let array = isConnected[idx]
            for j in 0 ..< array.count {
                if array[j] == 1 && !visited[j] {
                    dfs(isConnected, &visited, j)
                }
            }
        }
    }
}
