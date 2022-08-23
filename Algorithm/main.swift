//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

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

print(z.getAnwser(x: 0, y: 0, size: size))
