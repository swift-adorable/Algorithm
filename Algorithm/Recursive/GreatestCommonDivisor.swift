//
//  GreatestCommonDivisor.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import AppKit

class GreatestCommonDivisor {
    
    static func getGCD(m: Int, n: Int) -> Int {
        if n == 0 {
            return m
        }
        
        return getGCD(m: n, n: m%n)
    }
    
}
