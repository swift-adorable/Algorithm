//
//  994. Rotting Oranges.swift
//  Algorithm
//
//  Created by 이정호 on 5/11/26.
//

import Foundation

extension LeetCode75 {
    class RottingOranges {
        func orangesRotting(_ grid: [[Int]]) -> Int {
            let m = grid.count
            let n = grid[0].count
            var grid = grid
            var queue = [(Int, Int, Int)]()
            var freshCount = 0 // 싱싱한 오렌지 카운트
            
            // 1. 초기 상태 스캔
            for r in 0..<m {
                for c in 0..<n {
                    if grid[r][c] == 2 {
                        queue.append((r, c, 0))
                    } else if grid[r][c] == 1 {
                        freshCount += 1
                    }
                }
            }
            
            // 싱싱한 오렌지가 아예 없으면 0분 반환
            if freshCount == 0 { return 0 }
            
            var pointer = 0
            var lastTime = 0
            let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
            
            while pointer < queue.count {
                let (r, c, time) = queue[pointer]
                pointer += 1
                lastTime = time
                
                for (dr, dc) in directions {
                    let nr = r + dr
                    let nc = c + dc
                    
                    if nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 1 {
                        // 즉시 방문 처리 (중복 방지)
                        grid[nr][nc] = 2
                        freshCount -= 1
                        queue.append((nr, nc, time + 1))
                    }
                }
            }
            
            // BFS 종료 후 싱싱한 오렌지가 남았는지 확인
            return freshCount == 0 ? lastTime : -1
        }
    }
}
