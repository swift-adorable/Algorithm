//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

let bufferLine = readLine()

if let buffer = bufferLine {
    
    let bufferArr = buffer.split(separator: " ").map { Int($0) ?? 0 }
    let returnValue = GreatestCommonDivisor.getGCD(m: bufferArr[0], n: bufferArr[1])
    print(returnValue)
}
