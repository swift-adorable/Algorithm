//
//  OrdinaryKnapsack+BJ12865.swift
//  Algorithm
//
//  Created by 이정호 on 2022/09/05.
//

import Foundation

/*
 배낭 문제 - 물건(짐)을 쪼갤 수 있는 문제 (Fraction Knapsack Problem) => Greedy Algorithm
         ㄴ 물건(짐)을 쪼갤 수 없는 문제 (0/1 Knapsack Problem) => Dynamic Programming
 */

/*
 let fileIO = FileIO()

 let n = fileIO.readInt()
 let k = fileIO.readInt()
 var weight: [Int] = [0]
 var value: [Int] = [0]

 for _ in 0 ..< n {
     weight.append(fileIO.readInt())
     value.append(fileIO.readInt())
 }

 var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)

 func solution() -> Int {
     
     var maxValue: Int = 0
     
     for i in 1 ... n {
         let weight = weight[i]
         let value = value[i]
         print("weight: \(weight), value: \(value)")
         for j in 1 ... k {
             
             if weight <= j {
                 dp[i][j] = max(value + dp[i-1][j-weight], dp[i-1][j])

             } else {
                 dp[i][j] = dp[i-1][j]
             }

             maxValue = max(maxValue, dp[i][j])
             
         }
     }
     
     return maxValue
     
 }

 print(solution())

 */
