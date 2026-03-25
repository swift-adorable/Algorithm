# 🚀 Swift Array 성능 최적화: removeFirst() vs Pointer

## 1. `Array.removeFirst()`의 동작 원리와 문제점
Swift의 `Array`는 메모리에 요소들이 **연속적으로 배치**된 자료구조입니다. 따라서 첫 번째 요소를 제거하면 다음과 같은 비용이 발생합니다.

### 🔴 시간 복잡도: $O(N)$
- **동작 원리**: 인덱스 `0`을 제거한 후, 뒤에 남은 모든 요소(`1`부터 `N-1`까지)를 한 칸씩 앞으로 당겨야(Shifting) 합니다.
- **문제점**: 루프(Loop) 내에서 호출될 경우 전체 시간 복잡도가 **$O(N^2)$**으로 급증합니다. 데이터가 10,000개라면 최대 1억 번의 연산이 발생할 수 있습니다.

---

## 2. 프로페셔널한 대안: 인덱스 포인터 (Cursor)
데이터를 실제로 메모리에서 지우지 않고, **현재 유효한 데이터의 시작 위치를 가리키는 변수(Pointer)**를 두는 방식입니다.

### 🟢 시간 복잡도: $O(1)$
- **동작 원리**: 단순히 정수형 변수(`headIndex`)의 값만 `+1` 해줍니다.
- **장점**: 데이터 이동(Shifting)이 전혀 없으므로 데이터 양에 상관없이 **상수 시간** 내에 완료됩니다.

---

## 3. 코드 비교 (Dota2 Senate 예시)

### ❌ 비효율적인 방식 (removeFirst)
```swift
while !radiant.isEmpty && !dire.isEmpty {
    let r = radiant.removeFirst() // 매번 O(N) 발생!
    let d = dire.removeFirst()    // 매번 O(N) 발생!
    // ... logic ...
}
```

### ✅ 효율적인 방식 (Pointer)
```swift
var rIdx = 0
var dIdx = 0
while rIdx < radiant.count && dIdx < dire.count {
    let r = radiant[rIdx] // O(1) 접근
    let d = dire[dIdx]    // O(1) 접근
    rIdx += 1             // O(1) 포인터 이동
    dIdx += 1             // O(1) 포인터 이동
    // ... logic ...
}
```

---

## 4. 실무 적용 가이드
1. **데이터 규모**: 데이터가 100개 미만이라면 `removeFirst()`를 써도 무방하지만, 그 이상이라면 반드시 **포인터 방식**이나 **Deque**를 고려해야 합니다.
2. **메모리 관리**: 포인터 방식은 앞부분 메모리가 유지됩니다. 만약 메모리가 극도로 부족한 환경이라면 일정 주기마다 `removeFirst(k)`를 호출해 배열을 정리하는 전략을 사용합니다.
3. **가독성 vs 성능**: 알고리즘 문제 풀이(PS)에서는 **성능**이 우선이므로 포인터 방식이 필수적입니다.

---
**💡 Professional Tip:**
"방을 빼기 위해 모든 가구를 옆방으로 옮기는 것(`removeFirst`)보다, 그냥 옆방으로 걸어가는 것(`Pointer`)이 훨씬 빠릅니다."
