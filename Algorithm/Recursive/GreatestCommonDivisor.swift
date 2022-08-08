//
//  GreatestCommonDivisor.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

class GreatestCommonDivisor {
    
    static func getGCD(m: Int, n: Int) -> Int {
        if n == 0 {
            return m
        }
        //DEBUG_LOG("getGCD: \(m%n)")
        return getGCD(m: n, n: m%n)
    }
    
}
