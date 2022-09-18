//
//  StudyCodingTest+KI2022.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/18.
//

import Foundation

class StudyCodingTest_KI2022 {
    struct Problem {
        let alpReq: Int
        let copReq: Int
        let alpRwd: Int
        let copRwd: Int
        let cost: Int
        
        init(_ problem: [Int]) {
            guard problem.count >= 5 else {
                alpReq = 0
                copReq = 0
                alpRwd = 0
                copRwd = 0
                cost = 0
                return
            }
            
            alpReq = problem[0]
            copReq = problem[1]
            alpRwd = problem[2]
            copRwd = problem[3]
            cost = problem[4]
        }
        
    }

    func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
            
        let maxAlpReq = problems.map { $0[0] }.max() ?? 0
        let maxCopReq = problems.map { $0[1] }.max() ?? 0
        print("maxAlpReq: \(maxAlpReq), maxCopReq: \(maxCopReq)")
        if maxAlpReq == 0 && maxCopReq == 0 { return 0 }
        
        var problems = problems
        problems.append([0,0,1,0,1]) //알고리즘 만 공부하는 경우
        problems.append([0,0,0,1,1]) //코딩 만 공부하는 경우
        
        let probs = problems.map { Problem($0) }
        
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: maxCopReq+1), count: maxAlpReq+1)
        //var dp = TwoDimensionArray.makeIt(rows: maxAlpReq + 1 , cols: maxCopReq + 1, repeatValue: Int.max)
        
        let alp = min(alp, maxAlpReq)
        let cop = min(cop, maxCopReq)

        dp[alp][cop] = 0
        
        for a in alp ..< maxAlpReq + 1 {
            for c in cop ..< maxCopReq + 1 {
                for prob in probs {
                    
                    if a < prob.alpReq || c < prob.copReq {
                        continue
                    }
                    
                    let nextAlp = min(maxAlpReq, a+prob.alpRwd)
                    let nextCop = min(maxCopReq, c+prob.copRwd)
                    
                    dp[nextAlp][nextCop] = min(dp[nextAlp][nextCop], dp[a][c]+prob.cost)
                    
                }
            }
        }
        
        return dp[maxAlpReq][maxCopReq]
    }

}

/*
 let alp = 0
 let cop = 0
 let problems = [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]]
 //let result = 13

 let result = solution(alp, cop, problems)

 print(result)

 */
