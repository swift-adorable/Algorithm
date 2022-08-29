//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

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

numOfPaper.getAnwser()
