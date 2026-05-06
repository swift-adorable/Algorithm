//
//  1466. Reorder Routes to Make All Paths.swift
//  Algorithm
//
//  Created by 이정호 on 5/6/26.
//

import Foundation

extension LeetCode75 {
    
    class ReorderRoutesToMakeAllPaths {
        func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
            var count = 0
            
            var neighbors: [[(Int, Bool)]] = Array(repeating: [], count: n)
            var visited: [Bool] = Array(repeating: false, count: n)
            
            for connection in connections {
                let start = connection[0]
                let end = connection[1]
                neighbors[start].append((end, true))
                neighbors[end].append((start, false))
            }

            for i in 0 ..< n {
                dfs(neighbors, &visited, &count, i)
            }
            
            return count
        }
        
        func dfs(_ neighbors: [[(Int, Bool)]], _ visited: inout [Bool], _ count: inout Int, _ node: Int) {
            
            visited[node] = true
            
            for neighbor in neighbors[node] {
                if !visited[neighbor.0] {
                    if neighbor.1 { count += 1 }
                    dfs(neighbors, &visited, &count, neighbor.0)
                }
            }
        }
        
    }
    
}
