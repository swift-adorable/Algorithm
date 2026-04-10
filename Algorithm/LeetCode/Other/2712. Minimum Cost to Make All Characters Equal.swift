//
//  2712. Minimum Cost to Make All Characters Equal.swift
//  Algorithm
//
//  Created by 이정호 on 10/17/24.
//

import Foundation

/*
 You are given a 0-indexed binary string s of length n on which you can apply two types of operations:

 Choose an index i and invert all characters from index 0 to index i (both inclusive), with a cost of i + 1
 Choose an index i and invert all characters from index i to index n - 1 (both inclusive), with a cost of n - i
 Return the minimum cost to make all characters of the string equal.

 Invert a character means if its value is '0' it becomes '1' and vice-versa.

 Example 1:
 
  - Input: s = "0011"
  - Output: 2
  - Explanation: Apply the second operation with i = 2 to obtain s = "0000" for a cost of 2.
              It can be shown that 2 is the minimum cost to make all characters equal.
 
 Example 2:

  - Input: s = "010101"
  - Output: 9
  - Explanation: Apply the first operation with i = 2 to obtain s = "101101" for a cost of 3.
            Apply the first operation with i = 1 to obtain s = "011101" for a cost of 2.
            Apply the first operation with i = 0 to obtain s = "111101" for a cost of 1.
            Apply the second operation with i = 4 to obtain s = "111110" for a cost of 2.
            Apply the second operation with i = 5 to obtain s = "111111" for a cost of 1.
            The total cost to make all characters equal is 9. It can be shown that 9 is the minimum cost to make all characters equal.
  
 Constraints:

 1 <= s.length == n <= 10^5
 s[i] is either '0' or '1'
 */

extension LeetCode {
    
    class MinimumCostToMakeAllCharactersEqual {
        
        func minimumCost(_ s: String) -> Int {
            let n = s.count
            let chars = Array(s)
            var cost = 0
            
            for i in 0..<n-1 {
                if chars[i] != chars[i+1] {
                    cost += min(i + 1, n - i - 1)
                }
            }
            
            return cost
        }
        
    }
        
}
/*
 
 반복문을 하나 제거 해도 결국 재귀 함수에 의해 시간 복잡도는 O(n^2)을 갖게 된다.
 
 func minimumCost(_ s: String) -> Int {

     let n = s.count

     if n == 1 {
         return 0
     } else if n == 2 {
         return s.first == s.last ? 0 : 1
     } else if let firstChar = s.first,
             s.filter({ $0 == firstChar }).count == s.count {
         return 0
     }

     let arr = Array(s)
     var minCost = Int.max

     let idx = n / 2

     var cost = 0
     let char = arr[idx]

     let leftStr = String(arr[0...idx-1])
     cost += leftCost(char, leftStr, 0)

     let rightStr = String(arr[idx+1..<n])
     cost += rightCost(char, rightStr, 0)

     minCost = min(minCost, cost)

     return minCost
 }
 
 
 아래 작성한 알고리즘은 O(n^2)의 시간 복잡도를 가지고 있어, 큰 입력값에 대해 비효율적
 
 func minimumCost(_ s: String) -> Int {
     
     let n = s.count
     
     if n == 1 {
         return 0
     } else if let firstChar = s.first,
               s.filter({ $0 == firstChar }).count == s.count {
         return 0
     }
     
     let arr = Array(s)
     var minCost = Int.max
     
     for i in 0 ..< n {
         var cost = 0
         let char = arr[i]
         
         if i > 0 {
             let leftStr = String(arr[0...i-1])
             cost += leftCost(char, leftStr, 0)
         }
         
         if i < n {
             let rightStr = String(arr[i+1..<n])
             cost += rightCost(char, rightStr, 0)
         }
         
         minCost = min(minCost, cost)
     }
     
     return minCost
 }
 
 private func leftCost(_ c: Character, _ s: String, _ cost: Int) -> Int {
     if s.isEmpty || String(c) == s {
         return cost
     }
     
     var bufferS = s
     if bufferS.count > 1 {
         _ = bufferS.removeLast()
     }
     guard c != s.last else {
         return leftCost(c, bufferS, cost)
     }
     let invert = invertString(bufferS)
     let newCost = cost + s.count
     return leftCost(c, invert, newCost)
 }
 
 private func rightCost(_ c: Character, _ s: String, _ cost: Int) -> Int {
     if s.isEmpty || String(c) == s {
         return cost
     }
     
     var bufferS = s
     if bufferS.count > 1 {
         _ = bufferS.removeFirst()
     }
     
     guard c != s.first else {
         return rightCost(c, bufferS, cost)
     }
     let invert = invertString(bufferS)
     let newCost = cost + s.count
     return rightCost(c, invert, newCost)
 }
 
 private func invertString(_ s: String) -> String {
     return String(s.map { $0 == "0" ? "1" : "0" })
 }
 
 */
