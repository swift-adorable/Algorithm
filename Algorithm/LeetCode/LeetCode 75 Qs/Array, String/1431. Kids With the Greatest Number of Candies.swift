//
//  1431. Kids With the Greatest Number of Candies.swift
//  Algorithm
//
//  Created by 이정호 on 3/11/26.
//

import Foundation

extension LeetCode75 {
    class KidsWithTheGreatestNumberOfCandies {
        func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
            let maxCandy = candies.max() ?? extraCandies
            return candies.map { ($0 + extraCandies) >= maxCandy }
        }
    }
}
