//
//  MakeConfetti+BaekJoon2630.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/24.
//

import Foundation

class MakeConfetti2630 {
    
    private var confetti: [[String]] = []
    
    private var blue: Int = 0
    private var white: Int = 0
    
    init(_ confetti: [[String]]) {
        self.confetti = confetti
    }
    //4180 0302 7289 9283
    func solution(x: Int, y: Int, size: Int) {
        
        if isPossibleCutOut(x: x, y: y, size: size) {
            return
        }
        
        let newSize = size / 2
        
        let xNS = x + newSize
        let yNS = y + newSize
        
        solution(x: x, y: y, size: newSize)
        solution(x: x, y: yNS, size: newSize)
        solution(x: xNS, y: y, size: newSize)
        solution(x: xNS, y: yNS, size: newSize)
    }
    
    private func isPossibleCutOut(x: Int, y: Int, size: Int) -> Bool {
        
        let value = confetti[x][y]
        
        for i in x ..< x+size {
            for j in y ..< y+size {
                if confetti[i][j] != value { return false }
            }
        }
        
        if value == "0" {
            white += 1
            
        } else if value == "1" {
            blue += 1
        }
        
        return true
    }
    
    func getAnwser() {
        print(white)
        print(blue)
    }
}
/*
 var buf: [[String]] = []
 var size = 0

 let limitedReadLine = readLine()

 if let limited = limitedReadLine,
    let limitedLine = Int(limited) {
     
     size = limitedLine
     
     for _ in 0 ..< limitedLine {
         
         let readLine = readLine()
         
         guard let readLine = readLine?.components(separatedBy: " ") else { break }

         buf.append(readLine)
     }
     
 }

 let makeConfetti = MakeConfetti2630(buf)

 makeConfetti.solution(x: 0, y: 0, size: size)

 makeConfetti.getAnwser()
 */


/*
8
1 1 0 0 0 0 1 1
1 1 0 0 0 0 1 1
0 0 0 0 1 1 0 0
0 0 0 0 1 1 0 0
1 0 0 0 1 1 1 1
0 1 0 0 1 1 1 1
0 0 1 1 1 1 1 1
0 0 1 1 1 1 1 1
 
8
1 1 1 1 0 0 1 1
1 1 1 1 0 0 1 1
0 0 0 0 1 1 0 0
0 0 0 0 1 1 0 0
1 1 1 1 0 0 0 0
1 1 1 1 0 0 0 0
1 1 1 1 0 0 1 1
1 1 1 1 0 0 1 1
 */
