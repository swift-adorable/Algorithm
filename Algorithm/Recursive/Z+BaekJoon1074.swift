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
    
    func getAnwser(x: Int, y: Int, size: Int) -> Int {
        
        if size == 2 {
            print(isPossibleZipped(x: x, y: y, size: size))
            return isPossibleZipped(x: x, y: y, size: size)
        }
        
        let newSize = size / 2
        
        let xNS = x + newSize
        let yNS = y + newSize
        
        return getAnwser(x: x, y: y, size: newSize)
        + getAnwser(x: x, y: yNS, size: newSize)
        + getAnwser(x: xNS, y: y, size: newSize)
        + getAnwser(x: xNS, y: yNS, size: newSize)
        
    }
    
    private func isPossibleZipped(x: Int, y: Int, size: Int) -> Int {
        
        for i in x ..< x+size {
            for j in y ..< y+size {
                if i == r && j == c {
                    let perI = i % size
                    let perJ = j % size
                    if perI == 0 && perJ == 0 {
                        return 0
                    } else if perI == 0 && perJ == 1 {
                        return 1
                    } else if perI == 1 && perJ == 0 {
                        return 2
                    } else if perI == 1 && perJ == 1 {
                        return 3
                    }
                }
            }
        }
        
        return 4
    }
    
}

/*
 
 var buf: [[String]] = []
 var size = 0

 let limitedReadLine = readLine()

 if let limitedReadLine = limitedReadLine,
    let limited = Int(limitedReadLine) {
     
     size = limited
     
     for _ in 0 ..< limited {
         
         let readLine = readLine()
         
         guard let readLine = readLine else { break }

         let s: [String] = readLine.map { String($0) }
         
         buf.append(s)
     }
     
 }

 let quadTree = QuadTree1992(buf)

 quadTree.getAnwser(x: 0, y: 0, size: size)

 quadTree.getResult()


 */

/*
 Input
 8
 11110000
 11110000
 00011100
 00011100
 11110000
 11110000
 11110011
 11110011
 */
