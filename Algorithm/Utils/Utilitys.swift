//
//  Utilitys.swift
//  Algorithm
//
//  Created by Picturesque on 2022/08/08.
//

import Foundation
import AppKit

func DEBUG_LOG(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        let fileName = file.split(separator: "/").last ?? ""
        let funcName = function.split(separator: "(").first ?? ""
        print("[\(fileName)] \(funcName)(\(line)): \(msg)")
    #endif
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
