//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

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

/*
case 1:
 
8
1 1 0 0 0 0 1 1
1 1 0 0 0 0 1 1
0 0 0 0 1 1 0 0
0 0 0 0 1 1 0 0
1 0 0 0 1 1 1 1
0 1 0 0 1 1 1 1
0 0 1 1 1 1 1 1
0 0 1 1 1 1 1 1
 
case 2:
 
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
