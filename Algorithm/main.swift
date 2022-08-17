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
