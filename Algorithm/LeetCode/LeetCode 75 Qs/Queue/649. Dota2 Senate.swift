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
