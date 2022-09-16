//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation

//let fileIO = FileIO()
//
//let n = fileIO.readInt()
//var buf: [Int] = []
//
//for _ in 0 ..< n {
//    buf.append(fileIO.readInt())
//}
//
//let tree = BinaryTree<Int>()
//
//buf.forEach {
//    tree.insert($0)
//}

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict: [Character:Int] = ["R" : 0, "T" : 0,
                                 "C" : 0, "F" : 0,
                                 "J" : 0, "M" : 0,
                                 "A" : 0, "N" : 0]
    
    for (survey, choice) in zip(survey, choices) {
        let alphabet = survey.map{ $0 }
        switch choice {
        case 1...3:
            let score = choice == 1 ? 3 : choice == 3 ? 1 : choice
            dict[alphabet[0]]! += score
        case 5...7:
            let score = choice == 5 ? 1 : choice == 7 ? 3 : 2
            dict[alphabet[1]]! += score
        default:
            continue
        }
    }
    
    var result = ""
    result += dict["R"]! >= dict["T"]! ? "R" : "T"
    result += dict["C"]! >= dict["F"]! ? "C" : "F"
    result += dict["J"]! >= dict["M"]! ? "J" : "M"
    result += dict["A"]! >= dict["N"]! ? "A" : "N"
    return result
}

let value = solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5])
print(value)

