//
//  649. Dota2 Senate.swift
//  Algorithm
//
//  Created by 이정호 on 3/25/26.
//

import Foundation

extension LeetCode75 {
    class Dota2Senate {
        func predictPartyVictory(_ senate: String) -> String {
            var radiant: [Int] = []
            var dire: [Int] = []
            
            for (i, s) in senate.enumerated() {
                if s == "R" {
                    radiant.append(i)
                } else {
                    dire.append(i)
                }
            }
            let cnt = senate.count
            while !radiant.isEmpty && !dire.isEmpty {
                let r = radiant.removeFirst()
                let d = dire.removeFirst()
                if r < d {
                    radiant.append((r + cnt))
                } else {
                    dire.append((d + cnt))
                }
            }
            
            if radiant.isEmpty {
                return "Dire"
            } else {
                return "Radiant"
            }
        }
    }
}
/*
 class Solution {
     func predictPartyVictory(_ senate: String) -> String {
         var radiant: [Int] = []
         var dire: [Int] = []
         
         // 1. 초기 인덱스 분리
         for (i, char) in senate.enumerated() {
             if char == "R" {
                 radiant.append(i)
             } else {
                 dire.append(i)
             }
         }
         
         let n = senate.count
         var rIdx = 0 // Radiant 큐의 현재 읽기 위치
         var dIdx = 0 // Dire 큐의 현재 읽기 위치
         
         // 2. 양쪽 진영에 의원이 남아있는 동안 반복
         while rIdx < radiant.count && dIdx < dire.count {
             if radiant[rIdx] < dire[dIdx] {
                 // Radiant 승리: 다음 라운드 인덱스로 추가 (배열 끝에 append)
                 radiant.append(radiant[rIdx] + n)
             } else {
                 // Dire 승리: 다음 라운드 인덱스로 추가
                 dire.append(dire[dIdx] + n)
             }
             // 투표권을 행사했거나 권리를 박탈당했으므로 둘 다 포인터 이동
             rIdx += 1
             dIdx += 1
         }
         
         // 3. 어느 큐가 먼저 소진되었는지 확인하여 결과 반환
         return dIdx == dire.count ? "Radiant" : "Dire"
     }
 }
 */
