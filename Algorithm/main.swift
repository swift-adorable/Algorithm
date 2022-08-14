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

while true {
    let readLine = readLine()
    if readLine == "0" {
        print("")
        break
        
    } else  {
        print("")
        guard let bufArr = readLine?.components(separatedBy: " ") else { break }
        //let k = Int(bufArr.first ?? "") ?? 0
        let s: [String] = bufArr[1..<bufArr.count].map { String($0) }
        
        let instance = Lotto6603(s)
        instance.lotto(idx: 0, depth: 0)
        print("")
    }
}
/*
7 1 2 3 4 5 6 7
8 1 2 3 5 8 13 21 34
0
 */

