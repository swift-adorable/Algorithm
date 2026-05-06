//
//  841. Keys and Rooms.swift
//  Algorithm
//
//  Created by 이정호 on 4/17/26.
//

import Foundation

extension LeetCode75 {
    class KeysAndRooms {
        func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
            var visited: [Bool] = Array(repeating: false, count: rooms.count)
            dfs(rooms, &visited, 0)
            return visited.allSatisfy { $0 }
        }
        
        func dfs(_ rooms: [[Int]], _ visited: inout [Bool], _ room: Int) {
            visited[room] = true
            rooms[room].forEach { key in
                if !visited[key] {
                    dfs(rooms, &visited, key)
                }
            }
        }
    }
}
