//
//  main.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation
var maxValue = 0

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var queue: [Int] = [0]
    var isVisited = [Bool](repeating: false, count: edges.count)

    var sheep = 0
    var wolf = 0
    
    var pt = 0 //이동 포인터
    while pt < queue.count {
        let node = queue[pt]

        if node
        
        isVisited[pt] = true
        pt += 1
        
        for (index, edge) in edges.enumerated() {
            if edge[0] != node { continue }
            
            if isVisited[index] == false {
                isVisited[index] = true
                queue.append(edge[1])
            }
        }
                
    }
    
    return maxValue
}

let info = [0,1,0,1,1,0,1,0,0,1,0]
let edges = [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]
let answer = solution(info, edges)
print(answer)
