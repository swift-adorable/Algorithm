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
let limit = Int(limited) {
 
    let whatsRecursive = WhatIsRecursive17478(limit)
    
    whatsRecursive.solution(n: limit)
 
}
