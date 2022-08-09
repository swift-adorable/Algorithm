//
//  GreatestCommonDivisor.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

class GreatestCommonDivisor {

//    //최대공약수
//    let value = GreatestCommonDivisor.getGCD(m: bufferArr[0], n: bufferArr[1])
    
    static func getGCD(m: Int, n: Int) -> Int {
        if n == 0 {
            return m
        }
        //DEBUG_LOG("getGCD: \(m%n)")
        return getGCD(m: n, n: m%n)
    }
    
}
