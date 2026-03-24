# reserveCapacity(_:) 가이드

`reserveCapacity(_:)`는 컬렉션(Array, Dictionary, Set, String)이 데이터를 담기 위해 필요한 **메모리 공간을 미리 예약**하는 메서드입니다. 대량의 데이터를 다룰 때 발생하는 불필요한 성능 저하를 방지하는 핵심 기법입니다.

---

### 1. 왜 필요한가? (The Problem: Reallocation)

Swift의 가변형 컬렉션은 데이터를 추가할 때 내부적으로 **동적 배열(Dynamic Array)** 구조를 사용합니다.

1. **공간 부족**: 할당된 메모리가 꽉 차면, 새로운 데이터를 넣을 공간이 없습니다.
2. **재할당(Reallocation)**: 시스템은 기존보다 더 큰(보통 2배) 새로운 메모리 블록을 찾습니다.
3. **데이터 복사**: 기존 공간에 있던 모든 데이터를 **새로운 공간으로 일일이 복사**합니다.
4. **오버헤드**: 데이터가 10만 개라면 최대 10만 번의 복사 연산이 추가로 발생하며, 이는 CPU에 큰 부담을 줍니다.

---

### 2. 작동 원리 (The Solution: Pre-allocation)

`reserveCapacity`를 호출하면 시스템에 **"나중에 이만큼 쓸 거니까 미리 자리를 비워줘"**라고 선언하는 것과 같습니다.

* **효과**: 데이터를 추가(`append`)할 때 '공간 확인 및 복사' 과정을 생략하고 즉시 메모리에 기록합니다.
* **시간 복잡도**: 재할당 시 $O(n)$까지 치솟을 수 있는 추가 연산 비용을 제거하여, 안정적인 **평균 $O(1)$**을 유지합니다.

---

### 3. 실전 구현 예시

#### ✅ Array에서 사용 (데이터 변환 시)
```swift
func transformData(_ input: [Int]) -> [String] {
    var results = [String]()
    
    // input의 크기만큼 결과 배열의 공간을 미리 예약
    results.reserveCapacity(input.count)
    
    for item in input {
        results.append("ID: \(item)") // 재할당 없이 즉시 추가
    }
    return results
}
