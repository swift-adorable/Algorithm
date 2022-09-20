//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

/*
 - 어떤 차량이 입차된 후에 출차된 내역이 없다면, 23:59에 출차된 것으로 간주합니다
 - 차량 번호가 작은 자동차부터 청구할 주차 요금을 차례대로 정수 배열에 담아서 return
 - 누적 주차 시간이 기본 시간을 초과하면, 기본 요금에 더해서, 초과한 시간에 대해서 단위 시간 마다 단위 요금을 청구합니다.
    초과한 시간이 단위 시간으로 나누어 떨어지지 않으면, 올림합니다.
    ⌈a⌉ : a보다 작지 않은 최소의 정수를 의미합니다. 즉, 올림을 의미합니다.
 - 아래의 예를 포함하여, 잘못된 입력은 주어지지 않습니다.
    주차장에 없는 차량이 출차되는 경우
    주차장에 이미 있는 차량(차량번호가 같은 차량)이 다시 입차되는 경우
 */

import Foundation

struct Fee {
    let basicTime: Int
    let basicFee: Int
    let unitTime: Int
    let unitFee: Int
    
    init(_ fees: [Int]) {
        basicTime = fees[0]
        basicFee = fees[1]
        unitTime = fees[2]
        unitFee = fees[3]
    }
}

struct InOutRecord {
    let time: Int
    let InOut: String
    
    init() {
        time = 23 * 60 + 59
        InOut = "OUT"
    }
    
    init(_ record: [String]) {
        let bufTime = record[0].split(separator: ":").map { Int($0) }
        time = (bufTime[0] ?? 0) * 60 + (bufTime[1] ?? 0)
        
        InOut = record[2]
    }
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    let fee = Fee(fees)
    
    var dict: [String: [InOutRecord]] = [:]
    
    records.forEach { record in
        let bufRecord = record.split(separator: " ").map { String($0) }
        
        let inOutRecord = InOutRecord(bufRecord)
        
        let carNumber = bufRecord[1]
        
        if dict[carNumber] == nil {
            dict.updateValue([inOutRecord], forKey: carNumber)
        } else {
            dict[carNumber]?.append(inOutRecord)
        }
        
    }
    
    let bufDict = dict.sorted(by: { $0.key < $1.key })
    
    var answer = [Int](repeating: 0, count: bufDict.count)

    for (index, (_, records)) in bufDict.enumerated() {
        
        var feeToPay = 0
        
        let totalTime = calculateTimeFromRecord(records)
        
        if totalTime < fee.basicTime {
            feeToPay = fee.basicFee
            
        } else {
            var gap = totalTime - fee.basicTime
            if gap % fee.unitTime != 0 {
                gap = ((gap / fee.unitTime)*fee.unitTime) + fee.unitTime
            }
            
            feeToPay = fee.basicFee + ((gap / fee.unitTime) * fee.unitFee)
        }
        
        answer[index] = feeToPay
    }
    
    return answer
}

func calculateTimeFromRecord(_ record: [InOutRecord]) -> Int {
    var totalTime = 0
    var bufRecord = record
    
    if record.count % 2 != 0 {
        bufRecord.append(InOutRecord())
    }
    
    for i in 0 ..< bufRecord.count {
        if i % 2 != 1 { continue }
        totalTime += bufRecord[i].time - bufRecord[i-1].time
    }
    
    return totalTime
}

//let fees = [180, 5000, 10, 600]
//let records = ["05:34 5961 IN", "06:00 0000 IN",
//               "06:34 0000 OUT", "07:59 5961 OUT",
//               "07:59 0148 IN", "18:59 0000 IN",
//               "19:09 0148 OUT", "22:59 5961 IN",
//               "23:00 5961 OUT"]
//result = [14600, 34400, 5000]

let fees = [120, 0, 60, 591]
let records = ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]
// result = [0, 591]

let answer = solution(fees, records)

print("answer: \(answer)")
