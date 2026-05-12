
# Priority Queue & Heap

안녕하세요. 오늘은 알고리즘 효율성의 핵심인 **우선순위 큐(Priority Queue)** 와 그 구현체인 **힙(Heap)** 에 대해 전문적인 관점에서 정리해 보겠습니다.

---

## 1. 우선순위 큐 (Priority Queue)의 정의

일반적인 큐(Queue)가 들어온 순서대로 나가는 **FIFO(First-In-First-Out)** 구조라면, **우선순위 큐**는 데이터의 '우선순위'를 기준으로 가장 높은 데이터가 먼저 나가는 자료구조입니다.

### 큐 vs 우선순위 큐 비교

| 구분 | 일반 큐 (Queue) | 우선순위 큐 (Priority Queue) |
| :--- | :--- | :--- |
| **정렬 기준** | 삽입된 시간 순서 | **데이터의 중요도(우선순위)** |
| **데이터 추출** | 가장 먼저 들어온 것 | 우선순위가 가장 높은 것 |
| **활용 예시** | 프로세스 처리, 대기열 | 응급실 진료, 네트워크 패킷 전송 |

---

## 2. 힙 (Heap)이란?

우선순위 큐를 가장 효율적으로 구현할 수 있는 자료구조가 바로 **힙(Heap)** 입니다. 힙은 **완전 이진 트리(Complete Binary Tree)** 형태를 띠며, 부모와 자식 노드 간의 일정한 대소 관계를 유지합니다.

### 힙의 종류
- **최대 힙 (Max Heap)**: 부모 노드가 자식 노드보다 항상 크거나 같습니다. (루트 = 최댓값)
- **최소 힙 (Min Heap)**: 부모 노드가 자식 노드보다 항상 작거나 같습니다. (루트 = 최솟값)

### 시간 복잡도 (Time Complexity)
- **삽입 (Push)**: **O(log N)**
- **삭제 (Pop)**: **O(log N)**
- **조회 (Peek)**: **O(1)**

---

## 3. 힙의 동작 원리와 배열 표현

힙은 트리 구조를 가지지만, 실제 구현 시에는 인덱스 접근 속도를 높이기 위해 **배열(Array)** 을 사용합니다. 



### 인덱스 계산 공식 (1번 인덱스 시작 기준)
- **부모 노드**: `현재 인덱스 / 2`
- **왼쪽 자식**: `현재 인덱스 * 2`
- **오른쪽 자식**: `현재 인덱스 * 2 + 1`

---

## 4. Swift 개발자를 위한 Professional Tip

Swift는 다른 언어(C++, Java)와 달리 표준 라이브러리에 **Heap이 기본 내장되어 있지 않습니다.** 따라서 실무나 코딩 테스트에서는 직접 구현하여 사용해야 합니다.

1. **구현 핵심**: `SiftUp`(삽입 시 재배치)과 `SiftDown`(삭제 시 재배치) 로직을 정확히 이해하는 것이 중요합니다.
2. **Apple 공식 라이브러리**: 더 정교한 기능이 필요하다면 Apple에서 공개한 오픈소스인 `swift-collections`의 `Heap` 모듈을 참고하는 것도 좋은 방법입니다.

---

## 5. 실무 활용 사례

- **최단 경로 탐색**: 다익스트라(Dijkstra) 알고리즘에서 거리가 가장 짧은 노드를 효율적으로 추출할 때 필수입니다.
- **Top K 문제**: 실시간 스트리밍 데이터 중 상위 10개의 요소를 유지하고 관리할 때 유용합니다.
- **이벤트 스케줄링**: 예약된 작업 중 실행 시간이 가장 임박한 작업을 우선적으로 처리할 때 사용됩니다.

---

## 6. Swift로 구현하는 정석 Heap (Generic)

Swift 표준 라이브러리에는 Heap이 없기 때문에, 아래와 같이 배열을 기반으로 한 `Struct` 형태의 구현을 숙지해두는 것이 좋습니다. 이 코드는 프로페셔널한 설계를 위해 **Generic**과 **Closure**를 활용했습니다.



```swift
struct Heap<T> {
    private var nodes: [T] = []
    private let comparer: (T, T) -> Bool

    var isEmpty: Bool { nodes.isEmpty }
    var count: Int { nodes.count }

    // comparer: (parent, child) -> Bool
    // 최소 힙: < , 최대 힙: >
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }

    func peek() -> T? {
        nodes.first
    }

    mutating func insert(_ element: T) {
        nodes.append(element)
        siftUp(from: nodes.count - 1)
    }

    mutating func pop() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 { return nodes.removeFirst() }
        
        let result = nodes[0]
        nodes[0] = nodes.removeLast()
        siftDown(from: 0)
        
        return result
    }

    // 삽입 시: 아래에서 위로 재배치 (Sift Up)
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && comparer(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    // 삭제 시: 위에서 아래로 재배치 (Sift Down)
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = parent * 2 + 1
            let rightChild = parent * 2 + 2
            var candidate = parent
            
            if leftChild < nodes.count && comparer(nodes[leftChild], nodes[candidate]) {
                candidate = leftChild
            }
            
            if rightChild < nodes.count && comparer(nodes[rightChild], nodes[candidate]) {
                candidate = rightChild
            }
            
            if candidate == parent { return }
            
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

// 사용 예시
// 최소 힙 (Min Heap)
var minHeap = Heap<Int>(comparer: <)
minHeap.insert(10)
minHeap.insert(5)
print(minHeap.pop()!) // 5

// 최대 힙 (Max Heap)
var maxHeap = Heap<Int>(comparer: >)
maxHeap.insert(10)
maxHeap.insert(20)
print(maxHeap.pop()!) // 20
```
