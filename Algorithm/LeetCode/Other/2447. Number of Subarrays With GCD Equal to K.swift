//
//  2447. Number of Subarrays With GCD Equal to K.swift
//  Algorithm
//
//  Created by 이정호 on 10/16/24.
//

import Foundation

/*
 Given an integer array nums and an integer k,
 return the number of subarrays of nums where the greatest common divisor of the subarray's elements is k.
 A subarray is a contiguous non-empty sequence of elements within an array.
 The greatest common divisor of an array is the largest integer that evenly divides all the array elements.

 Example 1:

  - Input: nums = [9,3,1,2,6,3], k = 3
  - Output: 4
  - Explanation: The subarrays of nums where 3 is the greatest common divisor of all the subarray's elements are:
   - [9,3,1,2,6,3]
   - [9,3,1,2,6,3]
   - [9,3,1,2,6,3]
   - [9,3,1,2,6,3]

 Example 2:

  - Input: nums = [4], k = 7
  - Output: 0
  - Explanation: There are no subarrays of nums where 7 is the greatest common divisor of all the subarray's elements.
 
 Example 3:

  - Input: nums = [9,3,1,2,6,3,3], k = 3
  - Output: 7
 
 Constraints:
  1 <= nums.length <= 1000, 1 <= nums[i], k <= 10^9
 */

extension LeetCode {
    
    class NumberOfSubarraysWithGCDEqualToK {
        
        func subarrayGCD(_ nums: [Int], _ k: Int) -> Int {
            var value = 0
            let arrayCount = nums.count
            for row in 0..<arrayCount {
                
                var minIdx = 0

                while minIdx + row <= arrayCount-1 {
                    let subArray = row > 0 ? nums[minIdx...(minIdx+row)] : [nums[minIdx]]
                    
                    var bufferGCD = 0
                    
                    if subArray.count == 1, let x = subArray.first {
                        bufferGCD = getGCD(m: x, n: x)
                        
                    } else if subArray.count == 2 {
                        bufferGCD = getGCD(m: subArray[subArray.startIndex], n: subArray[subArray.endIndex-1])
                        
                    } else {
                        for subArrIndex in subArray.startIndex..<subArray.endIndex {
                            if subArrIndex == subArray.startIndex {
                                bufferGCD = getGCD(m: subArray[subArrIndex], n: subArray[subArrIndex+1])
                            } else if subArrIndex+1 < subArray.endIndex {
                                bufferGCD = getGCD(m: bufferGCD, n: subArray[subArrIndex+1])
                            }
                        }
                        
                    }
                    if bufferGCD == k {
                        value += 1
                    }
                    minIdx += 1
                }
                
            }
            
            return value
            
        }
        
        private func getGCD(m: Int, n: Int) -> Int {
            if n == 0 {
                return m
            }
            return getGCD(m: n, n: m%n)
        }
        
    }
    
}

/*
 ///Solution
 Approach
 I used the basic Euclidean Algorithm for GCD computation, then used this function inside a nested for loop.

 Within the scope of the first for loop, I have decalred a variable to hold the current number.

 Within the second for loop, we overwrite the current variable to hold the new GCD of the subarray, essentially using the current variable to hold the GCD of the subarray until current element. And if GCD == k, we can increment res

 If it some point we have GCD of subarray is less than k, we can get an early exit from the inner-loop and move on to the next element of nums

 Complexity
 Time complexity: O(n^2)
 Space complexity: O(1)
 Code
 class Solution {
     func subarrayGCD(_ nums: [Int], _ k: Int) -> Int {
        
         //We define a GCD function that uses Basic Euclidean Algorithm for GCD
         func gcd(_ a: Int, _ b: Int) -> Int {
             return b == 0 ? a : gcd(b, a % b)
         }

         let n = nums.count
         var res = 0

         //The rest is simple brute force
         for i in 0..<n {
             var currentGCD = nums[i]

             for j in i..<n {
                 currentGCD = gcd(currentGCD, nums[j])

                 if currentGCD == k {
                     res += 1
                 } else if currentGCD < k {
                     break
                 }
             }
         }

         return res
     }
 }
 */
