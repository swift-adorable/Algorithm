# 참조(Reference) vs 복사(Copy)

## 참조 (Reference)

참조는 주로 클래스 인스턴스에서 사용되는 방식입니다.

### 특징:
1.  **메모리 공유**: 여러 변수가 동일한 메모리 주소를 가리킵니다.
2.  **변경 영향**: 한 변수를 통해 객체를 변경하면 모든 참조에 영향을 줍니다.
3.  **식별 연산자**: `===`를 사용하여 두 변수가 같은 인스턴스를 참조하는지 확인합니다.

```swift
class Person {
    var name: String
    init(name: String) { 
        self.name = name 
    }
}

let person1 = Person(name: "Alice")
let person2 = person1

person2.name = "Bob"
print(person1.name) // 출력: "Bob"
print(person1 === person2) // 출력: true
```

## 복사 (Copy)

복사는 주로 구조체와 같은 값 타입에서 사용되는 방식입니다.

#### 특징:

1.  **독립적인 인스턴스**: 각 변수는 자신만의 독립적인 데이터 복사본을 가집니다.
2.  **변경 독립성**: 한 복사본을 변경해도 다른 복사본에 영향을 주지 않습니다.
3.  **메모리 효율**: Swift는 copy-on-write 최적화를 사용하여 필요할 때만 실제 복사를 수행합니다.

### 깊은 복사 vs 얕은 복사

1.  **깊은 복사 (Deep Copy)**: 객체와 그 객체가 참조하는 모든 객체를 재귀적으로 복사합니다.
2.  **얕은 복사 (Shallow Copy)**: 객체 자체만 복사하고, 내부 참조는 원본과 공유합니다.

클래스의 경우 기본적으로 얕은 복사가 이루어집니다. 깊은 복사가 필요한 경우 직접 구현해야 합니다.

```swift
struct Point {
    var x: Int
    var y: Int
}

var point1 = Point(x: 1, y: 2)
var point2 = point1

point2.x = 3
print(point1.x) // 출력: 1
print(point2.x) // 출력: 3
```

## 예시

```swift
struct ExampleStruct {
    var value: Int
}

class ExampleClass {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

// 구조체 예시
var structA = ExampleStruct(value: 10)
var structB = structA
structB.value = 20
print("structA.value: \(structA.value)") // 출력: structA.value: 10
print("structB.value: \(structB.value)") // 출력: structB.value: 20

// 클래스 예시
var classA = ExampleClass(value: 10)
var classB = classA
classB.value = 20
print("classA.value: \(classA.value)") // 출력: classA.value: 20
print("classB.value: \(classB.value)") // 출력: classB.value: 20
```

## 차이점:

-   클래스 인스턴스는 참조가 공유되어 `classB`의 변경이 `classA`에도 영향을 줍니다.
-   구조체는 각 인스턴스가 독립적인 값을 가집니다.

구조체는 간단한 데이터 타입이나 값의 독립성이 중요한 경우에 주로 사용되며, 클래스는 복잡한 데이터 구조나 참조 공유가 필요한 경우에 사용됩니다.

## 성능 고려사항

-   **참조**: 메모리 효율적이지만 참조 추적이 필요합니다.
-   **복사**: 각 인스턴스가 독립적이지만 큰 데이터의 경우 메모리 사용량이 증가할 수 있습니다.

Swift의 값 타입과 참조 타입을 적절히 사용하면 메모리 효율성과 코드의 안정성을 모두 얻을 수 있습니다.
