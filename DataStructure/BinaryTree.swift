//
//  BinaryTree.swift
//  Algorithm
//
//  Created by 이정호 on 2022/09/14.
//

//MARK: Complete Binary Tree 🔖
/*
 완전 이진트리(complete binary tree) 란⁉️
 - 노드가 위에서 아래로, 왼쪽에서 오른쪽으로 채워진다.
 - 루트 노드를 중심으로 두 개의 서브 트리로 나뉘어진다.
 - 모든 서브 트리도 모두 이진 트리이어야 한다.
 
    - 구현의 두 가지 방법
        - 배열: 인덱스를 활용하여 배열로 만든다. 편의상 배열의 첫 번째 요소는 사용하지 않는다.
        - 링크드 리스트
 
    - 용어
        - 노드(node): 트리의 구성 요소
        - 간선(edge): 노드와 노드를 연결하는 선
        - 루트 노드(root node): 루트 구조에서 최상위에 존재하는 노드
        - 단말 노드(terminal node): 아래로 또 다른 노드가 연결되어 있지 않은 노드
        - 내부 노드(internal node): 단말 노드를 제외한 모든 노드
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
