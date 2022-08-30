//
//  WhatIsRecursive+BaekJoon17478.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/29.
//

import Foundation

class WhatIsRecursive17478 {
    
    private var limit: Int = 0
    
    init(_ limit: Int) {
        self.limit = limit
    }
    
    let question = "\"재귀함수가 뭔가요?\""
    
    let anwser01 = ["\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.",
                    "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.",
                    "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\""]
    
    let anwser02 = "\"재귀함수는 자기 자신을 호출하는 함수라네\""
    
    func solution(n: Int) {
        
        if n == limit {
            print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
        }
        
        let diff = limit - n
        var underLine = ""
        if diff > 0 {
            for _ in 0..<diff {
                underLine += "____"
            }
        }
        
        print("\(underLine)\(question)")
        
        if n != 0 {
            anwser01.forEach {
                print("\(underLine)\($0)")
            }
            solution(n: n-1)
        }
        
        if n == 0 {
            print("\(underLine)\"재귀함수는 자기 자신을 호출하는 함수라네\"")
        }
        
        print("\(underLine)\("라고 답변하였지.")")
        
        
    }
    
}
