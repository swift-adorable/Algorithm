//
//  PrintingStar+BaekJoon2447.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/09.
//

import AppKit
import Foundation

class PrintingStar_BaekJoon2447 {
    
    static func printStar(arr: [[String]], n: Int, k: Int, x: Int, y: Int) -> [[String]] {
        
        var buf = arr
        let newY = y+1 < n ? y+1 : 0
        let newX = x+1 < n && newY == 0 ? x+1 : x
        
        if x == n-1 && y == n-1 {
            buf[x][y] = "*"
            return buf
        }
        
        for i in 0 ..< k {
            let powI = Int(pow(Float(3), Float(i)))
            if (x / powI) % 3 == 1 && (y / powI) % 3 == 1 {
                buf[x][y] = " "
                return printStar(arr: buf, n: n, k: k, x: newX, y: newY)
            }

        }

        buf[x][y] = "*"
        return printStar(arr: buf, n: n, k: k, x: newX, y: newY)
        
    }
}
