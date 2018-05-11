/*  9. Palindrome Number
    Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
 
    Example 1:
 
    Input: 121
    Output: true
 
    Example 2:
 
    Input: -121
    Output: false
    Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
    Example 3:
 
    Input: 10
    Output: false
    Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
    Follow up:
 
    Coud you solve it without converting the integer to a string?
*/

import Foundation

// Runtime: 264ms
class Solution1 {
    func isPalindrome(_ x: Int) -> Bool {
        let stringOfX = String(x)
        return stringOfX == String(stringOfX.reversed()) ? true : false
    }
}

// Runtime: 200ms
class Solution2 {
    func isPalindrome(_ x: Int) -> Bool {
        var copyOfX = x
        var reverseOfX = 0
        if x == 0 {
            return true
        }
        
        if x < 0 || x % 10 == 0 {
            return false
        }
        
        while copyOfX != 0 {
            reverseOfX = reverseOfX * 10 + copyOfX % 10
            copyOfX = copyOfX / 10
        }
        
        return x == reverseOfX ? true : false
    }
}

// Runtime: 216ms
class Solution3 {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        
        var copyOfX = x
        var div = 1
        
        while x / div >= 10 {
            div *= 10
        }
        
        while copyOfX > 0 {
            let left =  copyOfX / div
            let right = copyOfX % 10
            
            if left != right {
                return false
            }
            
            copyOfX = copyOfX % div / 10
            div /= 100
        }
        
        return true
    }
}
