//
//  Lotto+BaekJoon6603.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/14.
//

import AppKit
import Foundation

/*
7 1 2 3 4 5 6 7
8 1 2 3 5 8 13 21 34
0
 */

class Lotto6603 {
    var arr: [String]
    var ans = Array(repeating: "", count: 6)
    
    init(_ arr: [String]) {
        self.arr = arr
    }
    
    func lotto(idx: Int, depth: Int) {
        if depth == 6 {
            print("\(ans)")
            return
        }
        
        for i in idx ..< arr.count {
            ans[depth] = arr[i]
            lotto(idx: i+1, depth: depth+1)
        }
    }
}

/*
 
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


 */
