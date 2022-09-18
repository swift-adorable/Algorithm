//
//  TwoDimensionArray.swift
//  Algorithm
//
//  Created by Picturesque on 2022/09/17.
//

import Foundation

class TwoDimensionArray<T> {
    static func makeIt(rows: Int, cols: Int, repeatValue: T) -> [[T]] {
        let col = [T](repeating: repeatValue, count: cols)
        return [[T]](repeating: col, count: rows)
    }
}
