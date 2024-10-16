//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

let test = LeetCode.NumberOfSubarraysWithGCDEqualToK()
let value = test.subarrayGCD([9,3,1,2,6,3,3], 3)

print("output: \'\(value)\'")


let value1 = test.subarrayGCD([9,3,1,2,6,3], 3)

print("output: \'\(value1)\'")

let value2 = test.subarrayGCD([4], 7)

print("output: \'\(value2)\'")
