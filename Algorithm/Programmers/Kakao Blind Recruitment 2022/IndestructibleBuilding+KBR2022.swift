//
//  IndestructibleBuilding+KBR2022.swift
//  Algorithm
//
//  Created by 이정호 on 2022/09/22.
//

import Foundation

/*
 - MARK: 파괴되지 않은 건물
 
 [type, r1, c1, r2, c2, degree]
 type 1 - Attack
 type 2 - Heal
 
 degree - Damage of Attack Or Amount of Heal
 [r1][c1] -> [r2][c2]
 */

class IndestructibleBuilding_KBR2022 {
    
    
    func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
        let rows = board.count
        let cols = board.first!.count
        
        var bufArea = [[Int]](repeating: [Int](repeating: 0, count: cols+1), count: rows+1)
        
        for skill in skill {
            
            let type = skill[0]
            let (r1, c1) = (skill[1], skill[2])
            let (r2, c2) = (skill[3], skill[4])
            let degree = type == 1 ? -(skill[5]) : skill[5]
            
            bufArea[r1][c1] += degree
            bufArea[r1][c2+1] += -degree
            bufArea[r2+1][c1] += -degree
            bufArea[r2+1][c2+1] += degree
            
        }

        //각 행 더하기
        for i in 0..<bufArea.count {
            for j in 1 ..< bufArea[i].count {
                bufArea[i][j] += bufArea[i][j-1]
            }
        }

        //각 열 더하기
        for i in 0 ..< bufArea.first!.count {
            for j in 1 ..< bufArea.count {
                bufArea[j][i] += bufArea[j-1][i]
            }
        }
        
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                bufArea[i][j] += board[i][j]
            }
        }
        
        let answer = bufArea.flatMap { $0 }.filter { $0 > 0 }.count
        
        return answer
    }

    /*
     //MARK: 정확성 통과, 효율성 실패 (시간 초과)
     -> 시간복잡도를 줄이는 방법이 필요함.
     -> 누적 합 이용
     func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {

         var area = board
         
         for skill in skill {
             
             let type = skill[0]
             let (r1, c1) = (skill[1], skill[2])
             let (r2, c2) = (skill[3], skill[4])
             let degree = type == 1 ? -(skill[5]) : skill[5]
             
             for row in r1 ... r2 {
                 for col in c1 ... c2 {
                     area[row][col] += degree
                 }
             }
             
         }
         let answer = area.flatMap { $0 }.filter { $0 > 0 }.count
         
         return answer
     }
     */

}
