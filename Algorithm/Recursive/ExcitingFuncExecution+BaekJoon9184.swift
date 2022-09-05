//
//  ExcitingFuncExecution+BaekJoon9184.swift
//  Algorithm
//
//  Created by 이정호 on 2022/09/01.
//

import Foundation

class ExcitingFuncExecution9184 {
    
    func solution(_ a: Int, _ b: Int, _ c: Int) -> Int {
        
        if a <= 0 || b <= 0 || c <= 0 {
            return 1
        }
        
        if a > 20 || b > 20 || c > 20 {
            return solution(20, 20, 20)
        }
        
        if a < b && b < c {
            return solution(a, b, c-1) + solution(a, b-1, c-1) - solution(a, b-1, c)
        }
        
        return solution(a-1, b, c) + solution(a-1, b-1, c) - solution(a-1, b-1, c-1)
        
    }
    
}
