//
//  2462. Total Cost to Hire K Workers.swift
//  Algorithm
//
//  Created by 이정호 on 7/9/26.
//

// Apple 공식 swift-collections 라이브러리를 사용할 때의 임포트
// import HeapModule

extension LeetCode75 {
    class TotalCostToHireWorkers {
        func totalCost(_ costs: [Int], _ k: Int, _ candidates: Int) -> Int {
            
            /*
             // Heap에 들어갈 데이터 타입 정의 및 Comparable 프로토콜 준수
             struct Worker: Comparable {
                 let cost: Int
                 let index: Int
                 
                 // Apple Heap은 이 조건을 기준으로 정렬을 수행합니다.
                 static func < (lhs: Worker, rhs: Worker) -> Bool {
                     if lhs.cost == rhs.cost {
                         return lhs.index < rhs.index // 비용이 같으면 인덱스가 작은 쪽 우선
                     }
                     return lhs.cost < rhs.cost // 비용이 다르면 비용이 작은 쪽 우선
                 }
             }
             
             func totalCost(_ costs: [Int], _ k: Int, _ candidates: Int) -> Int {
                 let n = costs.count
                 
                 // Apple 공식 Heap 초기화 인터페이스 사용
                 var frontHeap = Heap<Worker>()
                 var tailHeap = Heap<Worker>()
                 
                 var left = 0
                 var right = n - 1
                 
                 // 1. 앞쪽 후보군 채우기
                 for _ in 0..<candidates {
                     if left <= right {
                         frontHeap.insert(Worker(cost: costs[left], index: left))
                         left += 1
                     }
                 }
                 
                 // 2. 뒤쪽 후보군 채우기
                 for _ in 0..<candidates {
                     if left <= right {
                         tailHeap.insert(Worker(cost: costs[right], index: right))
                         right -= 1
                     }
                 }
                 
                 var totalCost = 0
                 
                 // 3. K명 채용 루프
                 for _ in 0..<k {
                     let frontTop = frontHeap.min
                     let tailTop = tailHeap.min
                     
                     if let f = frontTop, let t = tailTop {
                         if f.cost <= t.cost {
                             _ = frontHeap.popMin()
                             totalCost += f.cost
                             
                             if left <= right {
                                 frontHeap.insert(Worker(cost: costs[left], index: left))
                                 left += 1
                             }
                         } else {
                             _ = tailHeap.popMin()
                             totalCost += t.cost
                             
                             if left <= right {
                                 tailHeap.insert(Worker(cost: costs[right], index: right))
                                 right -= 1
                             }
                         }
                     } else if let f = frontTop {
                         _ = frontHeap.popMin()
                         totalCost += f.cost
                     } else if let t = tailTop {
                         _ = tailHeap.popMin()
                         totalCost += t.cost
                     }
                 }
                 
                 return totalCost
             }
             */
            
            return 0
        }
    }
}
