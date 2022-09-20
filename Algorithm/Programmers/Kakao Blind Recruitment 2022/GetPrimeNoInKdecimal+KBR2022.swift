//
//  GetPrimeNoInKdecimal+KBR2022.swift
//  Algorithm
//
//  Created by 이정호 on 2022/09/20.
//

import Foundation

class GetPrimeNoInKdecimal_KBR2022 {
    
    /*
     - MARK: k진수에서 소수 개수 구하기
     
     정수 n -> k 진수 표기
     
     왼쪽부터 차례로 보면서 조건에 맞게 소수인지 판단 후 출력
     
     0P0처럼 소수 양쪽에 0이 있는 경우
     P0처럼 소수 오른쪽에만 0이 있고 왼쪽에는 아무것도 없는 경우
     0P처럼 소수 왼쪽에만 0이 있고 오른쪽에는 아무것도 없는 경우
     P처럼 소수 양쪽에 아무것도 없는 경우
     단, P는 각 자릿수에 0을 포함하지 않는 소수입니다.
     예를 들어, 101은 P가 될 수 없습니다.
     
     */

    func solution(_ n:Int, _ k:Int) -> Int {
        
        let convertedNum = convertToKNumber(n, k).reversed().map { String($0) }.reduce("", +)
        
        let splitToZero = convertedNum.split(separator: "0").map{ String($0) }
        
        var answer = 0
        
        for num in splitToZero {
            if isPrimeNumber(Int(num)!) {
                answer += 1
            }
        }
        
        return answer
    }

    func isPrimeNumber(_ num: Int) -> Bool {
        
        if num == 2 || num == 3 { return true }
        
        if num < 2 { return false }
        
        let sqrtNum = Int(sqrt(Double(num))) + 1
        
        for i in 2 ..< sqrtNum {
            if num % i == 0 {
                return false
            }
        }
        
        return true
    }

    func convertToKNumber(_ n: Int, _ k: Int) -> String {
        var bufN = n
        var convertedNum = ""
        
        while bufN > 0 {
            
            if bufN / k == 0 {
                convertedNum += "\(bufN)"
                break
            }
            
            let remain = bufN % k
            convertedNum += "\(remain)"
            
            bufN /= k
            
        }
        
        return convertedNum
    }

//    let n = 437674
//    let k = 3
//
//    //let n = 110011
//    //let k = 10
//
//    let answer = solution(n, k)
//
//    print("answer: \(answer)")

}
