//
//  605. Can Place Flowers.swift
//  Algorithm
//
//  Created by 이정호 on 3/11/26.
//

import Foundation

extension LeetCode75 {
    class CanPlaceFlowers {
        func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
            var flowerbed = [0] + flowerbed + [0]
            var cnt = 0
            for i in 1 ..< flowerbed.count-1 {
                if(flowerbed[i-1] == 0 && flowerbed[i] == 0 && flowerbed[i+1] == 0) {
                    flowerbed[i] = 1
                    cnt += 1
                    if cnt >= n { return true }
                }
            }
            return cnt >= n
        }
        /*
         func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
             // n이 0인 경우 검사할 필요 없이 true 반환
             if n == 0 { return true }
             
             var bed = flowerbed
             var count = 0
             let length = bed.count
             
             for i in 0..<bed.count {
                 // 현재 자리가 비어 있고(0), 양옆이 비어 있는지 확인
                 if bed[i] == 0 {
                     let prevEmpty = (i == 0) || (bed[i - 1] == 0)
                     let nextEmpty = (i == length - 1) || (bed[i + 1] == 0)
                     
                     if prevEmpty && nextEmpty {
                         // 꽃을 심고 count 증가
                         bed[i] = 1
                         count += 1
                         
                         if count >= n { return true }
                     }
                 }
             }
             
             return count >= n
         }
         */
    }
}
