//
//  2352. Equal Row and Column Pairs .swift
//  Algorithm
//
//  Created by 이정호 on 3/23/26.
//

import Foundation

extension LeetCode75 {
    class EqualRowAndColumnPairs {
        func equalPairs(_ grid: [[Int]]) -> Int {
            let gridCount = grid.count
            var colums: [[Int]] = Array(repeating: Array(repeating: Int(), count: gridCount), count: gridCount)
            for i in 0..<gridCount {
                for j in 0..<gridCount {
                    colums[j][i] = grid[i][j]
                }
            }
            var count = 0
            for col in colums {
                let equalcount = grid.count(where: { $0 == col })
                count += equalcount
            }
            return count
        }
        
        /*
         func equalPairs(_ grid: [[Int]]) -> Int {
             let n = grid.count
             var rowCounts = [[Int]: Int]()
             
             // 1. 모든 행(Row)의 등장 횟수를 해시 맵에 저장: O(n^2)
             for row in grid {
                 rowCounts[row, default: 0] += 1
             }
             
             var count = 0
             
             // 2. 각 열(Column)을 하나씩 추출하며 해시 맵에서 조회: O(n^2)
             for j in 0..<n {
                 var currentColumn = [Int]()
                 for i in 0..<n {
                     currentColumn.append(grid[i][j])
                 }
                 
                 // 해당 열과 똑같이 생긴 행이 있다면 그 개수만큼 더함
                 if let rowCount = rowCounts[currentColumn] {
                     count += rowCount
                 }
             }
             
             return count
         }
         */
    }
}
