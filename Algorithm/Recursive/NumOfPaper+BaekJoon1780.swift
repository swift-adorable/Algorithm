//
//  NumOfPaper+BaekJoon1780.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/29.
//

import Foundation

class NumOfPaper1780 {
    
    private var paper: [[Int]] = []
    
    private var negative: Int = 0
    private var zero: Int = 0
    private var positive: Int = 0
    
    init(_ paper: [[Int]]) {
        self.paper = paper
    }
    
    func solution(x: Int, y: Int, size: Int) {
        
        if isPossibleCutOut(x: x, y: y, size: size) {
            return
        }
        
        let newSize = size / 3
        
        for i in 0..<3 {
            for j in 0..<3 {
                let xNS = x + (newSize*i)
                let yNS = y + (newSize*j)
                solution(x: xNS, y: yNS, size: newSize)
            }
        }
        
    }
    
    private func isPossibleCutOut(x: Int, y: Int, size: Int) -> Bool {
        
        let value = paper[x][y]
        
        for i in x ..< x+size {
            for j in y ..< y+size {
                if paper[i][j] != value { return false }
            }
        }
        
        if value == -1 {
            negative += 1
        } else if value == 0 {
            zero += 1
        } else if value == 1 {
            positive += 1
        }
        
        return true
    }
    
    func getAnswer() {
        print(negative)
        print(zero)
        print(positive)
    }
}

/* MARK: Input
9
0 0 0 1 1 1 -1 -1 -1
0 0 0 1 1 1 -1 -1 -1
0 0 0 1 1 1 -1 -1 -1
1 1 1 0 0 0 0 0 0
1 1 1 0 0 0 0 0 0
1 1 1 0 0 0 0 0 0
0 1 -1 0 1 -1 0 1 -1
0 -1 1 0 1 -1 0 1 -1
0 1 -1 1 0 -1 0 1 -1
 */

/* MARK: by ReadLine
 
 var buf: [[Int]] = []
 var size = 0

 let limitedReadLine = readLine()

 if let limited = limitedReadLine,
 let limitedLine = Int(limited) {
  
     size = limitedLine

     for _ in 0 ..< limitedLine {
      
         let readLine = readLine()

         guard let readLine = readLine?.components(separatedBy: " ") else { break }

         let toIntArr = readLine.map { Int($0) ?? 0 }

         buf.append(toIntArr)
     }
  
 }

 //buf.forEach { print($0) }

 let numOfPaper = NumOfPaper1780(buf)

 numOfPaper.solution(x: 0, y: 0, size: size)

 numOfPaper.getAnswer()
 */

/* MARK: by FileIO
 private var size = 0
 private var paper: [[Int]] = []
 private var negative: Int = 0
 private var zero: Int = 0
 private var positive: Int = 0

 let fileIO = FileIO()

 let numOfLine = fileIO.readInt()

 size = numOfLine

 for _ in 0 ..< numOfLine {

     var buf: [Int] = []
     
     for _ in 0 ..< numOfLine {
         buf.append(fileIO.readInt())
     }
     paper.append(buf)

 }

 func solution(x: Int, y: Int, size: Int) {
     
     if isPossibleCutOut(x: x, y: y, size: size) {
         return
     }
     
     let newSize = size / 3
     
     for i in 0..<3 {
         for j in 0..<3 {
             solution(x: x + (newSize*i), y: y + (newSize*j), size: newSize)
         }
     }
     
 }

 private func isPossibleCutOut(x: Int, y: Int, size: Int) -> Bool {
     
     let value = paper[x][y]
     
     for i in x ..< x+size {
         for j in y ..< y+size {
             if paper[i][j] != value { return false }
         }
     }
     
     if value == -1 {
         negative += 1
     } else if value == 0 {
         zero += 1
     } else if value == 1 {
         positive += 1
     }
     
     return true
 }

 func getAnswer() {
     print(negative)
     print(zero)
     print(positive)
 }

 solution(x: 0, y: 0, size: size)
 getAnswer()

 */
