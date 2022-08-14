//
//  Lotto+BaekJoon6603.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/14.
//

import AppKit
import Foundation

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
