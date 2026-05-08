//
//  399. Evaluate Division.swift
//  Algorithm
//
//  Created by 이정호 on 5/8/26.
//

import Foundation

extension LeetCode75 {
    class EvaluateDivision {
        func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
            var adjList: [String: [String: Double]] = [:]
            
            zip(equations, values).forEach { (equation, value) in
                let (u, v) = (equation[0], equation[1])
                adjList[u, default: [:]][v] = value
                adjList[v, default: [:]][u] = 1.0 / value
            }
            
            var results: [Double] = []
            
            for query in queries {
                let start = query[0]
                let target = query[1]
                
                // 1. 예외 처리: 그래프에 없는 문자면 무조건 -1.0
                if adjList[start] == nil || adjList[target] == nil {
                    results.append(-1.0)
                    continue
                }
                
                // 2. 자기 자신: 문자만 존재한다면 a/a는 무조건 1.0
                if start == target {
                    results.append(1.0)
                    continue
                }
                
                // 3. 탐색 시작
                var visited: Set<String> = []
                let result = dfs(start, target, &visited, 1.0, adjList)
                results.append(result)
            }
            
            return results
        }

        // DFS 함수 구현
        func dfs(_ current: String, _ target: String, _ visited: inout Set<String>, _ currentProduct: Double, _ adjList: [String: [String: Double]]) -> Double {
            // 현재 노드 방문 처리
            visited.insert(current)
            
            // 이웃 노드들을 하나씩 확인
            if let neighbors = adjList[current] {
                for (next, value) in neighbors {
                    // 목표를 찾았다면? 지금까지 곱한 값에 현재 간선 값을 곱해서 반환!
                    if next == target {
                        return currentProduct * value
                    }
                    
                    // 아직 목표가 아니고, 방문한 적 없는 노드라면 더 깊이 들어감
                    if !visited.contains(next) {
                        let result = dfs(next, target, &visited, currentProduct * value, adjList)
                        
                        // 재귀 호출 결과가 -1.0이 아니라면 답을 찾은 것임! 즉시 반환(Early Return)
                        if result != -1.0 {
                            return result
                        }
                    }
                }
            }
            
            // 모든 이웃을 다 뒤졌는데도 target을 못 찾았다면 -1.0
            return -1.0
        }
        
    }
}
