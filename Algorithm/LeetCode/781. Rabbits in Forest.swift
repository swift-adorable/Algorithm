//
//  781. Rabbits in Forest.swift
//  Algorithm
//
//  Created by 이정호 on 11/25/24.
//

import Foundation

/*
 There is a forest with an unknown number of rabbits.
 We asked n rabbits "How many rabbits have the same color as you?"
 and collected the answers in an integer array answers where answers[i] is the answer of the ith rabbit.
 Given the array answers, return the minimum number of rabbits that could be in the forest.

 Example 1:
  - Input: answers = [1,1,2]
  - Output: 5
  - Explanation:
     The two rabbits that answered "1" could both be the same color, say red.
     The rabbit that answered "2" can't be red or the answers would be inconsistent.
     Say the rabbit that answered "2" was blue.
     Then there should be 2 other blue rabbits in the forest that didn't answer into the array.
     The smallest possible number of rabbits in the forest is therefore 5: 3 that answered plus 2 that didn't.
 
 Example 2:
  - Input: answers = [10,10,10]
  - Output: 11
  
 Constraints:
  - `1 <= answers.length <= 1000`
  - `0 <= answers[i] < 1000`
 */

extension LeetCode {
    
    class RabbitsInForest {
        func numRabbits(_ answers: [Int]) -> Int {
            var dicts = [Int:Int]()
            
            answers.forEach {
                dicts[$0, default: 0] += 1
            }
            
            let result = dicts
                .map { dict -> Int in
                    if dict.key == 0 {
                        return dict.value
                    } else {
                        let size = dict.key + 1
                        
                        if size >= dict.value {
                            return size
                        } else {
                            let ceil = ceil(Double(dict.value) / Double(size))
                            return Int(ceil) * size
                        }
                    }
                }
            
            return result
                .reduce(0, +)
            
        }
    }
    
}
