//
//  735. Asteroid Collision.swift
//  Algorithm
//
//  Created by 이정호 on 3/24/26.
//

import Foundation

extension LeetCode75 {
    class AsteroidCollision {
        func asteroidCollision(_ asteroids: [Int]) -> [Int] {
            var stack = [Int]()
            stack.reserveCapacity(asteroids.count) // 메모리 최적화
            
            for asteroid in asteroids {
                
                if asteroid > 0 {
                    stack.append(asteroid)
                    continue
                }
                
                var isAlive = true
                
                while let last = stack.last, last > 0, asteroid < 0 {
                    if last < -asteroid {
                        stack.removeLast()
                        continue
                    } else if last == -asteroid {
                        stack.removeLast()
                    }
                    isAlive = false
                    break
                }
                
                if isAlive { stack.append(asteroid) }
                
            }
            return stack
        }
    }
}
