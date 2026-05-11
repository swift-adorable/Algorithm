//
//  1926. Nearest Exit from Entrance in Maze.swift
//  Algorithm
//
//  Created by 이정호 on 5/11/26.
//

import Foundation

extension LeetCode75 {
    class NearestExitFromEntranceInMaze {
        func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
            let rows = maze.count
            let cols = maze[0].count
            var maze = maze // 방문 처리를 위해 가변 변수로 복사 (또는 visited 배열 사용)
            
            // 큐 저장 형태: [(row, col, distance)]
            var queue: [(Int, Int, Int)] = [(entrance[0], entrance[1], 0)]
            maze[entrance[0]][entrance[1]] = "+" // 시작점 방문 처리
            
            var head = 0 // Swift 배열을 큐처럼 쓰기 위한 포인터
            while head < queue.count {
                let (r, c, dist) = queue[head]
                head += 1
                
                // 상하좌우 탐색용
                let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
                
                for (dr, dc) in directions {
                    let nr = r + dr
                    let nc = c + dc
                    
                    // 1. 미로 범위 내에 있고, 2. 벽이 아닌('.') 경우
                    if nr >= 0 && nr < rows && nc >= 0 && nc < cols && maze[nr][nc] == "." {
                        
                        // [체크] 여기가 출구인가? (가장자리에 도달했는가?)
                        if nr == 0 || nr == rows - 1 || nc == 0 || nc == cols - 1 {
                            return dist + 1 // BFS이므로 처음 발견한 출구가 무조건 최단거리!
                        }
                        
                        // 방문 처리 및 큐 삽입
                        maze[nr][nc] = "+"
                        queue.append((nr, nc, dist + 1))
                    }
                }
            }
            
            return -1 // 탈출구를 찾지 못한 경우
        }
    }
}
