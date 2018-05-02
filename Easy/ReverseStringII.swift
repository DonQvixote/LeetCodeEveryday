/*  541.Reverse String II
    Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting from the start of the string. If there are less than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.
    Example:
    Input: s = "abcdefg", k = 2
    Output: "bacdfeg"
 
    Restrictions:
    The string consists of lower English letters only.
    Length of the given string and k will in the range [1, 10000]
 */

import Foundation

// Runtime: 52ms
class Solution1 {
    func reverseStr(_ s: String, _ k: Int) -> String {
        let strArray = Array(s)
        let group = strArray.count / k
        let res = strArray.count % k
        var reverseStr = ""
        
        if group == 0 {
            return String(s.reversed())
        }
        
        for i in 0...(group - 1) {
            if i % 2 == 0 {
                reverseStr += String(strArray[(0 + k * i)...(k * (i + 1) - 1)].reversed())
            } else {
                reverseStr += String(strArray[(0 + k * i)...(k * (i + 1) - 1)])
            }
        }
        
        if res > 0 {
            if group % 2 == 0 {
                reverseStr += String(strArray[(group * k)...(strArray.count - 1)].reversed())
            } else {
                reverseStr += String(strArray[(group * k)...(strArray.count - 1)])
            }
        }
        
        return reverseStr
    }
}

// Runtime: 64ms
class  Solution2 {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var chars = Array(s), reverseStr = [Character]()
        
        if k < 0 {
            fatalError("Invalid k")
        }
        
        for i in stride(from: 0, to: chars.count, by: 2 * k) {
            if chars.count < i + k {
                reverseStr += chars[i..<chars.count].reversed()
                break
            }
            
            reverseStr += chars[i..<i + k].reversed()
            
            if chars.count < i + 2 * k {
                reverseStr += chars[i + k..<chars.count]
                break
            }
            
            reverseStr += chars[i + k..<i + 2 * k]
        }
        
        return String(reverseStr)
    }
}
