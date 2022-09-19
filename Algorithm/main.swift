//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

/*
 만약, k(k는 1~10사이의 자연수)점을 어피치가 a발을 맞혔고 라이언이 b발을 맞혔을 경우 더 많은 화살을 k점에 맞힌 선수가 k 점을 가져갑니다.
 단, a = b일 경우는 어피치가 k점을 가져갑니다.
 라이언이 가장 큰 점수 차이로 우승할 수 있는 방법이 여러 가지 일 경우, 가장 낮은 점수를 더 많이 맞힌 경우를 return 해주세요.
 해당 점수를 얻을 것이라면 어피치가 맞춘 갯수보다 한 발을 더 맞추면 되고, 그렇지 않다면 아예 쏘지 않는 것이 최적
 */
func solution(_ n:Int, _ info:[Int]) -> [Int] {
//    print("apeach: \(info)")
//    var apeachScoreSum = 0
//    
//    info.enumerated().forEach { (idx, shot) in
//        let score = 10 - idx
//        if shot > 0 { apeachScoreSum += score }
//    }
//    
//    print("apeachScoreSum: \(apeachScoreSum)")
//    var lion = [Int](repeating: 0, count: 11)
//    lion[10] = n
//    print(lion)
//    var pt = 10
//    var pt2 = 10
//    while lion[0] != n || pt < 0 {
//        
//        if getScore(lion) > apeachScoreSum {
//            return lion
//        }
//        
//        while lion[pt]-1 > 0 {
//            lion[pt] -= 1
//            
//            while pt2-1 > 0 {
//                pt2 -= 1
//                if pt == pt2 {
//                    lion[pt2] += 1
//                } else {
//                    if pt2 != 0 {
//                        lion[pt2] += 1
//                        lion[pt2+1] -= 1
//                    }
//                }
//                print(lion)
//            }
//        }
//        
//        pt -= 1
//        
//    }
//    
    return [-1]//lionScore.reduce(0, +) > apeachScoreSum ? lionScore : [-1]
}

func getScore(_ lion: [Int]) -> Int {
    var score = 0
    
    lion.enumerated().forEach { (idx, shot) in
        if shot > 0 { score += (10 - idx) }
    }
    
    return score
}

let n = 5
let info = [2,1,1,1,0,0,0,0,0,0,0]
//result = [0,2,2,0,1,0,0,0,0,0,0]

let answer = solution(n, info)
