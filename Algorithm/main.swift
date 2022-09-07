//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

let fileIO = FileIO()

let n = fileIO.readInt()
var buf: [Int] = []

for _ in 0 ..< n {
    buf.append(fileIO.readInt())
}

print(buf)
