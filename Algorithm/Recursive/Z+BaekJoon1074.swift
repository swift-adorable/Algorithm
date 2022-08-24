//
//  Z+BaekJoon1074.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/23.
//

import Foundation


class Z1074 {
    
    private var size: Int = 0
    private var r: Int = 0
    private var c: Int = 0
    private var resultValue = 0
    
    init(size: Int, r: Int, c: Int) {
        self.size = size
        self.r = r
        self.c = c
    }
    
    func solution(x: Int, y: Int, size: Int) {

        if x == r && y == c {
            print("\(resultValue)")
            return
        }

        if (x <= r && r < x + size) && (y <= c && c < y + size) {
            
            let newSize = size / 2
            
            let xNS = x + newSize
            let yNS = y + newSize
            
            solution(x: x, y: y, size: newSize)
            solution(x: x, y: yNS, size: newSize)
            solution(x: xNS, y: y, size: newSize)
            solution(x: xNS, y: yNS, size: newSize)
            
        } else {
            resultValue += size * size
        }
        
    }
    
}

/*
 
 var n: Int = 0
 var r: Int = 0
 var c: Int = 0

 let input = readLine()

 if let input = input {
     
     let bufArr = input.components(separatedBy: " ")
     
     n = Int(bufArr[0]) ?? 0
     r = Int(bufArr[1]) ?? 0
     c = Int(bufArr[2]) ?? 0
 }

 let size = 2 ^^ n
 let z = Z1074(size: size, r: r, c: c)

 z.solution(x: 0, y: 0, size: size)

 */

/*
 Input
 case 1: 2 3 1
 
 case 2: 3 7 7
 
 case 3: 4 7 7
 */
