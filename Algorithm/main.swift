//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    //[신고자: [신고 당한 자]]
    var dict: [String: [String]] = [:]
    //[신고 당한 자: 신고 당한 횟수]
    var reportedCount: [String: Int] = [:]

    for r in report {
        let split = r.split(separator: " ").map { String($0) }

        let whoReporeted = split[0] //신고 한 사람
        let reportedPerson = split[1] //신고 당한 사람

        if dict[whoReporeted] == nil {
            dict.updateValue([reportedPerson], forKey: whoReporeted)

        } else if !(dict[whoReporeted]?.contains(reportedPerson) ?? true) {
            dict[whoReporeted]?.append(reportedPerson)
        }
    }
    
    dict.forEach {
        $0.value.forEach {
            if reportedCount[$0] == nil {
                reportedCount[$0] = 1
            } else {
                reportedCount[$0]! += 1
            }
        }
    }
    
    var answer: [Int] = [Int](repeating: 0, count: id_list.count)
    
    for i in 0 ..< id_list.count {
        let id = id_list[i]
        
        dict[id]?.forEach {
            if (reportedCount[$0] ?? 0) >= k {
                answer[i] += 1
            }
        }

    }
    
    return answer
}


let id_list = ["muzi", "frodo", "apeach", "neo"]
let report = ["muzi frodo", "apeach frodo", "frodo neo", "muzi neo", "apeach muzi"]
let k = 2

//answer = [2,1,1,0]

//let id_list = ["con", "ryan"]
//let report = ["ryan con", "ryan con", "ryan con", "ryan con"]
//let k = 3
//answer = [0,0]

let answer = solution(id_list, report, k)

print("answer: \(answer)")
