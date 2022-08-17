//
//  QuadTree+BaekJoon1992.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/16.
//

import Foundation

class QuadTree1992 {
    
    private var str: String = ""
    private var arr: [[String]] = []
    
    init(_ arr: [[String]]) {
        self.arr = arr
    }
    
    func getAnwser(x: Int, y: Int, size: Int) {

        if isPossibleZipped(x: x, y: y, size: size) {
            str += "\(arr[x][y]) "
            return
        }
        
        str += "( "
        
        let newSize = size / 2
        
        let xNS = x + newSize
        let yNS = y + newSize
        
        getAnwser(x: x, y: y, size: newSize)
        getAnwser(x: x, y: yNS, size: newSize)
        getAnwser(x: xNS, y: y, size: newSize)
        getAnwser(x: xNS, y: yNS, size: newSize)
        
        str += ") "
    }
    
    private func isPossibleZipped(x: Int, y: Int, size: Int) -> Bool {
        
        let value = arr[x][y]
        
        for i in x ..< x+size {
            for j in y ..< y+size {
                if value != arr[i][j] { return false }
            }
        }
        
        return true
    }
    
    func getResult() {
        print(str)
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
