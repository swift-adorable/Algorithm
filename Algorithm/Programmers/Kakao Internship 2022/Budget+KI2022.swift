//
//  Budget+KI2022.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/16.
//

import Foundation

class Budget_KI2022 {
    func solution(_ d:[Int], _ budget:Int) -> Int {
        
        let sortedDepart = d.sorted()
        
        var result = 0
        var sum = 0
        
        for depart in sortedDepart {
            if sum + depart <= budget {
                sum += depart
                result += 1
            } else {
                break
            }
        }
            
        return result
    }
}
