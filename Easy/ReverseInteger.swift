/*  7. Reverse Integer
    Given a 32-bit signed integer, reverse digits of an integer.
 
    Example 1:
 
    Input: 123
    Output: 321
    Example 2:
 
    Input: -123
    Output: -321
    Example 3:
 
    Input: 120
    Output: 21
    Note:
    Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
*/

import Foundation

// Runtime: 44ms
class Solution1 {
    func reverse(_ x: Int) -> Int {
        if x == 0 {
            return x
        }
        
        let digits = String(x)
        let reverseDigits = x > 0 ? String(digits.reversed()).trimmingCharacters(in: ["0"]) : String(digits.trimmingCharacters(in: ["-"]).reversed()).trimmingCharacters(in: ["0"])
        
        if Int(reverseDigits)! > Int(Int32.max) || -Int(reverseDigits)! < Int(Int32.min) {
            return 0
        }
        
        return x > 0 ? Int(reverseDigits)! : -Int(reverseDigits)!
    }
}

// Runtime: 32ms
class Solution2 {
    func reverse(_ x: Int) -> Int {
        var integer = x
        var reverseInteger = 0
        
        while integer != 0 {
            reverseInteger = reverseInteger * 10 + integer % 10
            integer /= 10
            
            if reverseInteger > Int32.max || reverseInteger < Int32.min {
                return 0
            }
        }
        
        return reverseInteger
    }
}
