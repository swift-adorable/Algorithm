//
//  MakeTwoQueueSumEqual+KI2022.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/17.
//

import Foundation

//MARK: First - 22~24 시간 초과
/*
 - 원인:
    - 배열의 크기가 커질수록 removeFirst 와 append가 시간 초과의 원인이 되는 듯하다.
 */
/*
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {

 var bufQ1 = queue1
 var bufQ2 = queue2

 var sumQ1 = queue1.reduce(0, +)
 let sumQ2 = queue2.reduce(0, +)

 if (sumQ1 + sumQ2) % 2 != 0 {
     return -1
 }

 let targetValue = (sumQ1 + sumQ2) / 2

 if targetValue == sumQ1 { return 0 }

 var count = 0

 while (sumQ1 != targetValue) {

     if count > (queue1.count*3) {
         return -1
     }

     if sumQ1 > targetValue {

         let value = bufQ1.removeFirst()
         sumQ1 -= value
         bufQ2.append(value)

     } else {

         let value = bufQ2.removeFirst()
         sumQ1 += value
         bufQ1.append(value)

     }

     count += 1

 }

 return count
}
 */

//MARK: Second 통과
/*
 First 의 문제를 해결하기 위해 두 큐를 합쳐 배열의 푸시, 팝을 하지 않고 포인터 개념 활용.
 while 문이 끝나고도 목표 값과 한쪽 큐의 합이 같지 않을 경우의 조건 때문에 테스트 케이스 11, 28번 실패
 if targetValue != sumQ1 { return -1 } 추가
 */

class MakeTwoQueueSumEqual_KI2022 {
    func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {

        let bufQueueAll = queue1 + queue2
        
        var ptLeft = 0
        var ptRight = queue1.count
        
        var sumQ1 = queue1.reduce(0, +)
        let sumQ2 = queue2.reduce(0, +)

        if (sumQ1 + sumQ2) % 2 != 0 {
            return -1
        }

        let targetValue = (sumQ1 + sumQ2) / 2

        if targetValue == sumQ1 { return 0 }

        var count = 0

        while ptLeft <= ptRight && ptRight < bufQueueAll.count {

            if sumQ1 > targetValue {

                let value = bufQueueAll[ptLeft]
                sumQ1 -= value
                ptLeft += 1
                
            } else if sumQ1 < targetValue {

                let value = bufQueueAll[ptRight]
                sumQ1 += value
                ptRight += 1

            } else {
                break
            }

            count += 1

        }
        
        if targetValue != sumQ1 { return -1 }
        
        return count
    }
}
