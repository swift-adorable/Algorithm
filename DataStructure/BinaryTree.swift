//
//  BinaryTree.swift
//  Algorithm
//
//  Created by ์ด์ ํธ on 2022/09/14.
//

//MARK: Complete Binary Tree ๐
/*
 ์์  ์ด์งํธ๋ฆฌ(complete binary tree) ๋โ๏ธ
 - ๋ธ๋๊ฐ ์์์ ์๋๋ก, ์ผ์ชฝ์์ ์ค๋ฅธ์ชฝ์ผ๋ก ์ฑ์์ง๋ค.
 - ๋ฃจํธ ๋ธ๋๋ฅผ ์ค์ฌ์ผ๋ก ๋ ๊ฐ์ ์๋ธ ํธ๋ฆฌ๋ก ๋๋์ด์ง๋ค.
 - ๋ชจ๋  ์๋ธ ํธ๋ฆฌ๋ ๋ชจ๋ ์ด์ง ํธ๋ฆฌ์ด์ด์ผ ํ๋ค.
 
    - ๊ตฌํ์ ๋ ๊ฐ์ง ๋ฐฉ๋ฒ
        - ๋ฐฐ์ด: ์ธ๋ฑ์ค๋ฅผ ํ์ฉํ์ฌ ๋ฐฐ์ด๋ก ๋ง๋ ๋ค. ํธ์์ ๋ฐฐ์ด์ ์ฒซ ๋ฒ์งธ ์์๋ ์ฌ์ฉํ์ง ์๋๋ค.
        - ๋งํฌ๋ ๋ฆฌ์คํธ
 
    - ์ฉ์ด
        - ๋ธ๋(node): ํธ๋ฆฌ์ ๊ตฌ์ฑ ์์
        - ๊ฐ์ (edge): ๋ธ๋์ ๋ธ๋๋ฅผ ์ฐ๊ฒฐํ๋ ์ 
        - ๋ฃจํธ ๋ธ๋(root node): ๋ฃจํธ ๊ตฌ์กฐ์์ ์ต์์์ ์กด์ฌํ๋ ๋ธ๋
        - ๋จ๋ง ๋ธ๋(terminal node): ์๋๋ก ๋ ๋ค๋ฅธ ๋ธ๋๊ฐ ์ฐ๊ฒฐ๋์ด ์์ง ์์ ๋ธ๋
        - ๋ด๋ถ ๋ธ๋(internal node): ๋จ๋ง ๋ธ๋๋ฅผ ์ ์ธํ ๋ชจ๋  ๋ธ๋
 */

import Foundation

class Node<T: Comparable> {
    var value: T
    
    var left: Node?
    var right: Node?
    
    init(_ value: T) {
        self.value = value
    }
    
    var isFull: Bool {
        return left != nil && right != nil
    }
    
}

class BinaryTree<T: Comparable> {
    var root: Node<T>?
    
}

//MARK: - Insert
extension BinaryTree {
    func insert(_ value: T) {
        guard let root = self.root else {
            print("set root node value: \(value)")
            return self.root = Node(value)
        }
        
        let newNode = Node(value)
        insert(root: root, node: newNode)
        
    }
    
    //Recursive
    private func insert(root: Node<T>, node: Node<T>) {
//        if root.value < node.value {
//            guard let left = root.left else {
//                print("set left node value: \(node.value), with root: \(root.value)")
//                return root.left = node
//            }
//            insert(root: left, node: node)
//
//        } else {
//            guard let right = root.right else {
//                print("set right node value: \(node.value), with root: \(root.value)")
//                return root.right = node
//            }
//            insert(root: right, node: node)
//        }
        if root.left == nil {
            print("set left node value: \(node.value), with root: \(root.value)")
            root.left = node
            return
        } else if root.right == nil {
            print("set right node value: \(node.value), with root: \(root.value)")
            root.right = node
            return
        }
        
        if (root.left?.isFull ?? false) && (root.right?.isFull ?? false) {
            insert(root: root.left!, node: node)
            return
        }
        
        if let left = root.left, !left.isFull {
            insert(root: left, node: node)
            return
        }

        if let right = root.right {
            insert(root: right, node: node)
            return
        }
        
    }
}
