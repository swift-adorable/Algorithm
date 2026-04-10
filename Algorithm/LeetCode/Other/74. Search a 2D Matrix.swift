//
//  74. Search a 2D Matrix.swift
//  Algorithm
//
//  Created by 이정호 on 11/21/24.
//

import Foundation

/*
 You are given an m x n integer matrix matrix with the following two properties:

 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.
 Given an integer target, return true if target is in matrix or false otherwise.

 You must write a solution in O(log(m * n)) time complexity.

 Example 1:
  - Input: matrix = [[1,3,5,7],
                     [10,11,16,20],
                     [23,30,34,60]], target = 3
  - Output: true
 
 Example 2:
  - Input: matrix = [[1,3,5,7],
                     [10,11,16,20],
                     [23,30,34,60]], target = 13
  - Output: false
 */

extension LeetCode {
    
    class SearchA2DMatrix {
        
        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {

            var arr = matrix.flatMap { $0 }
            
            var result = false
            
            while arr.isEmpty == false {
                
                let max = arr.count
                let idx = max / 2
                
                if arr[idx] == target {
                    result = true
                    break
                }
                
                if arr.count == 1 {
                    break
                }
                
                if arr[idx] > target {
                    arr = Array(arr[0..<idx])
                } else {
                    arr = Array(arr[idx..<max])
                }

            }
            
            return result
            
        }
        
//        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//                let rows = matrix.count
//                let cols = matrix[0].count
//
//                var left = 0
//                var right = rows * cols - 1
//
//                while left <= right {
//                    let mid = left + (right - left) / 2
//                    let midValue = matrix[mid / cols][mid % cols]
//
//                    if midValue == target {
//                        return true
//                    } else if midValue < target {
//                        left = mid + 1
//                    } else {
//                        right = mid - 1
//                    }
//                }
//                return false
//            }
//        }
        
//        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//                let row = matrix.count
//                guard let column = matrix.first?.count else { return false }
//                var result = false
//                
//                for i in 0..<row {
//                    if let lastTime = matrix[i].last, lastTime >= target {
//                         result = matrix[i].contains(target)
//                        if result { return result }
//                    } else {
//                       continue
//                    }
//                }
//
//                return result
//            }
        
    }
    
}
