//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

//let bufferLine = readLine()
//
//if let bufferLine = bufferLine {
//
//    let n = Int(bufferLine) ?? 3
//    var k = 1
//
//    while true {
//        if n == Int(pow(3.0, Double(k))) { break }
//        k += 1
//    }
//
//    let arr: [[String]] = Array(repeating: Array(repeating: "", count: n), count: n)
//    let value = PrintingStar_BaekJoon2447.printStar(arr: arr, n: n, k: k, x: 0, y: 0)
//
//    value.forEach {
//        var str = ""
//        $0.forEach {
//            str += "\($0)"
//        }
//        DEBUG_LOG("\(str)")
//    }
//}
//

var bufReadLine: [String] = []

while true {
    let readLine = readLine()
    if readLine == "0" {
        break
        
    } else  {
        bufReadLine.append(readLine ?? "")
    }
}

for buf in bufReadLine {
    let bufArr = buf.components(separatedBy: " ")
    let k = Int(bufArr.first ?? "") ?? 0
    let s: [String] = bufArr[1..<bufArr.count].map { String($0) }
    
    print("k: \(k), s: \(s)")
    
    
}

func printLotto(k: Int, s: [String]) {
    
}
