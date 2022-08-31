//
//  FileIO+byRhino.swift
//  Algorithm
//
//  Created by 이정호 on 2022/08/31.
//

/*
 원본 출처:
 - https://github.com/JCSooHwanCho
 - https://velog.io/@rarebook92/%EB%B0%B1%EC%A4%80%EC%9D%80-Swift%EC%97%90%EA%B2%8C-%EA%B4%80%EB%8C%80%ED%95%B4%EB%9D%BC
 
 Xcode에서는 입력받은 후 print() 문을 써도 자동으로는 안보인다.
 EOF방식이라서 리눅스 명령어를 써야하는데 ctrl+d를 커맨드창에서 사용하면 지금까지 입력한 입력값을 종료하고 print() 함수가 실행된다.
 */

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}
