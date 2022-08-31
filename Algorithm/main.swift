//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

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
