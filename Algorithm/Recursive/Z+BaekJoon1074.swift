//
//  Z+BaekJoon1074.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/23.
//

import Foundation


class Z1074 {
    
    private var size: Int = 0
    private var r: Int = 0
    private var c: Int = 0
    private var resultValue = 0
    
    init(size: Int, r: Int, c: Int) {
        self.size = size
        self.r = r
        self.c = c
    }
    
    func getAnwser(x: Int, y: Int, size: Int) {

        if x == r && y == c {
            print("\(resultValue)")
            return
        }

        if (x <= r && r < x + size) && (y <= c && c < y + size) {
            
            let newSize = size / 2
            
            let xNS = x + newSize
            let yNS = y + newSize
            
            getAnwser(x: x, y: y, size: newSize)
            getAnwser(x: x, y: yNS, size: newSize)
            getAnwser(x: xNS, y: y, size: newSize)
            getAnwser(x: xNS, y: yNS, size: newSize)
            
        } else {
            resultValue += size * size
        }
        
    }
    
}

/*
 
 */

/*
 Input
 2 3 1
 3 7 7
 4 7 7
 */
