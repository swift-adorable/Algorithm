
# 🧮 Prefix Sum (누적 합) 알고리즘 가이드

**Prefix Sum**은 배열의 특정 구간 합(Range Sum Query)을  **$O(1)$** 의 시간으로 해결하기 위해 사용하는 사전 계산(Pre-computation) 기법입니다.

---

## 1. 핵심 개념 (Core Concept)
원본 배열의 첫 번째 요소부터 각 인덱스까지의 합을 미리 계산하여 별도의 배열에 저장합니다.

* **원본 배열 (A):** `[a0, a1, a2, ..., an]`
* **누적 합 배열 (P):** `[P0, P1, P2, ..., Pn+1]`
    * $P[1] = a0$
    * $P[2] = a0 + a1$
    * $P[i] = P[i-1] + a_{i-1}$



---

## 2. 구간 합 계산 공식 (Range Sum Formula)
Prefix Sum 배열이 준비되면, 인덱스 **i**부터 **j**까지의 구간 합은 단 한 번의 뺄셈으로 구할 수 있습니다.

> **구간 합 (i ~ j) = P[j + 1] - P[i]**

* **원리:** 0부터 j까지의 전체 합에서, 우리가 원하지 않는 0부터 i-1까지의 합을 제외하는 논리입니다.

---

## 3. 알고리즘 효율성 비교 (Efficiency)

데이터 개수 $N$, 구간 합 질문 횟수 $M$일 때:

| 구분 | 단순 반복문 (Loop) | 누적 합 (Prefix Sum) |
| :--- | :--- | :--- |
| **1회 조회 속도** | $O(N)$ | **$O(1)$** |
| **전체 시간 복잡도** | $O(N \times M)$ | **$O(N + M)$** |

---

## 4. Swift 프로페셔널 구현 (Best Practice)
인덱스 계산 실수(Off-by-one error)를 방지하기 위해, 배열의 크기를 **N + 1**로 설정하고 0번 인덱스를 **0**으로 비워두는 것이 표준적인 구현 방식입니다.

```swift
func createPrefixSum(_ nums: [Int]) -> [Int] {
    // 1. N + 1 크기의 배열 생성 (0으로 초기화)
    var prefixSum = Array(repeating: 0, count: nums.count + 1)
    
    // 2. 누적 합 계산 (O(N))
    for i in 0..<nums.count {
        prefixSum[i + 1] = prefixSum[i] + nums[i]
    }
    
    return prefixSum
}

// 예시: nums[1...3] (인덱스 1부터 3까지)의 합 구하기
// let sum = prefixSum[4] - prefixSum[1]
