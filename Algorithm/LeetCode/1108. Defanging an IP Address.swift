//
//  1108. Defanging an IP Address.swift
//  Algorithm
//
//  Created by 이정호 on 11/22/24.
//

import Foundation

/*
 Given a valid (IPv4) IP address, return a defanged version of that IP address.

 A defanged IP address replaces every period "." with "[.]".

 Example 1:

 Input: address = "1.1.1.1"
 Output: "1[.]1[.]1[.]1"
 
 Example 2:

 Input: address = "255.100.50.0"
 Output: "255[.]100[.]50[.]0"
  
 Constraints:

 The given address is a valid IPv4 address.
 */

extension LeetCode {
    
    class DefangingAnIPAddress {
        
        func defangIPaddr(_ address: String) -> String {
                
            return address.replacingOccurrences(of: ".", with: "[.]")
            
        }
        
    }
    
}
