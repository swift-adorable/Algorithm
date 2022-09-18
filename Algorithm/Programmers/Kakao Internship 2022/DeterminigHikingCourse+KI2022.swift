//
//  DeterminigHikingCourse+KI2022.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/17.
//

import Foundation

//MARK: PriorityQueue
/*
 gates 와 summits 을 Set 해준 이유: 런타임을 줄일 수 있다.
 
 배열 pq의 removeFirst을 사용하지 않고 pt를 사용해 런타임 줄임.
 => 사실 Priority Queue를 이용하여야 함.
 
 다익스트라 알고리즘 응용한 문제. 다익스트라 알고리즘은 출발지에서 목적지까지의 최단 경로를 찾는 알고리즘.
 */

class DeterminingHikingCourse_KI2022 {
    
    func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
        let summits = Set(summits)
        let gates = Set(gates)
        var conn: [[(Int, Int)]] = [[(Int, Int)]](repeating: [], count: n+1)
        
        var pt = 0
        
        for path in paths {
            let i = path[0]
            let j = path[1]
            let w = path[2]
            conn[i].append((j, w))
            conn[j].append((i, w))
        }
        
        var pq = gates.map { ($0,0) }
        let MAX = 10000001
        var min_dis: [Int] = [Int](repeating: MAX, count: n+1)
        
        while pt < pq.count {
            
            let (node, intensity) = pq[pt]
            pt += 1
            
            if min_dis[node] <= intensity {
                continue
            }
            
            min_dis[node] = intensity
            
            if summits.contains(node) {
                continue
            }

            for (nxt, nxt_w) in conn[node] {
                let nxt_w = max(intensity, nxt_w)
                if min_dis[nxt] <= nxt_w {
                    continue
                }
                
                pq.append((nxt, nxt_w))

            }
            
        }

        var answer = [0, MAX] //(산봉우리, intensity)

        for summit in summits {
            if min_dis[summit] < answer[1] {
                answer[0] = summit
                answer[1] = min_dis[summit]
            } else if min_dis[summit] == answer[1] && summit < answer[0] {
                answer[0] = summit
            }
        }
        
        return answer
    }

}

/*
 //let n = 6
 //let paths = [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]]
 //let gates = [1, 3]
 //let summits = [5]
 //result = [5, 3]

 let n = 7
 let paths = [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]]
 let gates = [3, 7]
 let summits = [1, 5]
 //result = [5, 1]

 let answer = solution(n, paths, gates, summits)

 print(answer)}
 */
