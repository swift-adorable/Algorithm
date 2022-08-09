//
//  LowestCommonMultiple.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

class LowestCommonMultiple {
//    //최소공배수
//    let value = LowestCommonMultiple.getLCM(m: bufferArr[0], n: bufferArr[1])
    
    static func getLCM(m: Int, n: Int) -> Int {
        return m * n / GreatestCommonDivisor.getGCD(m: m, n: n)
    }
}
