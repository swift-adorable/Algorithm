//
//  CompetitionArchery+KBR2022.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/19.
//

import Foundation

class CompetitionArchery_KBR2022 {
    
    /*
     만약, k(k는 1~10사이의 자연수)점을 어피치가 a발을 맞혔고 라이언이 b발을 맞혔을 경우 더 많은 화살을 k점에 맞힌 선수가 k 점을 가져갑니다.
     단, a = b일 경우는 어피치가 k점을 가져갑니다.
     라이언이 가장 큰 점수 차이로 우승할 수 있는 방법이 여러 가지 일 경우, 가장 낮은 점수를 더 많이 맞힌 경우를 return 해주세요.
     해당 점수를 얻을 것이라면 어피치가 맞춘 갯수보다 한 발을 더 맞추면 되고, 그렇지 않다면 아예 쏘지 않는 것이 최적
     힌트 : dfs
     */

    var subMax = 0
    var answer: [Int] = []

    func solution(_ n:Int, _ info:[Int]) -> [Int] {
        
        let ryan = [Int](repeating: 0, count: 11)
        
        dfs(n, 10, info, ryan)

        return answer
    }

    func dfs(_ n: Int, _ score: Int, _ info: [Int], _ ryan: [Int]) {
        if n == 0 || score == 0 {
            //화살 수가 0이 되거나 탐색 점수가 0점인 경우
            var bufRyan = ryan
            if score == 0 {
                //화살을 다 사용하지않고 탐색의 점수가 먼저 0점이 된 경우
                bufRyan[10] = n
            }
            
            let (apeach_s, ryan_s) = getScore(info, bufRyan)
            
            if ryan_s > apeach_s {
                //라이언 점수가 어피치 점수보다 더 높은 경우에만 갱신
                let sub = ryan_s - apeach_s
                if subMax < sub {
                    //라이언 점수와 어피치의 점수 차가 더 높은 경우 무조건 갱신
                    answer = bufRyan
                    subMax = sub
                    
                } else if subMax == sub && compareLast(answer, bufRyan) {
                    //새로운 탐색 점수판이 라이언 현재 점수와 같지만 더 낮은 점수의 화살 수가 많은 경우 갱신
                    answer = bufRyan
                }
            }
            
            return
        }
        
        let index = 10 - score
        
        //라이언이 점수를 획득하는 경우
        if n > info[index] {
            var bufRyan = ryan
            var bufN = n
            bufRyan[index] = info[index]+1
            bufN = bufN - info[index] - 1
            dfs(bufN, score-1, info, bufRyan)
        }
        //라이언이 점수를 획득 안하는 경우
        let bufRyan = ryan
        dfs(n, score-1, info, bufRyan)
        
    }

    func compareLast(_ org: [Int], _ new: [Int]) -> Bool {
        for i in 0 ..< 11 {
            let index = 10 - i
            if org[index] < new[index] {
                //새로운 라이언 점수판의 낮은 점수에서 화살 수가 더 많은 경우
                return true
            } else if org[index] > new[index] {
                //기존 점수판의 낮은 점수에서 화살 수가 더 많은 경우
                return false
            }
        }
        return false
    }

    func getScore(_ a: [Int], _ b: [Int]) -> (Int, Int) {
        var aSum = 0
        var bSum = 0
        
        for (index, (a, b)) in zip(a, b).enumerated() {
            let score = 10 - index
            if a == 0 && b == 0 { continue }
            if a >= b {
                aSum += score
            } else if a < b {
                bSum += score
            }
        }
        return (aSum, bSum)
    }

//    let n = 5
//    let info = [2,1,1,1,0,0,0,0,0,0,0]
//    //result = [0,2,2,0,1,0,0,0,0,0,0]
//
//    let result = solution(n, info)
//
//    print(result)

}
