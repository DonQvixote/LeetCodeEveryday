/*  5. Longest Palindromic Substring
    Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
    Example 1:
 
    Input: "babad"
    Output: "bab"
    Note: "aba" is also a valid answer.
    Example 2:
 
    Input: "cbbd"
    Output: "bb"
*/

import Foundation

// Time Limit Exceeded
class Solution1 {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 && s.count <= 1000 else {
            return s
        }
        
        var dict = [Int: String]()
        var chars = Array(s)
        var maxLength = 0
        
        for i in 0..<chars.count {
            for j in i+1..<chars.count {
                if String(chars[i...j]) == String(chars[i...j].reversed()) {
                    dict[j - i + 1] = String(chars[i...j])
                    maxLength = max(maxLength, j - i + 1)
                }
            }
        }
        
        return maxLength > 0 ? dict[maxLength]! : String(chars.first!)
    }
}

// Runtime: 884ms
class Solution2 {
    func longestPalindrome(_ s: String) -> String {
        var chars = Array(s)
        var isPalindrome = Array(repeating: Array(repeating: false, count: chars.count), count: chars.count)
        var maxLength = 0
        var maxStart = 0
        
        for i in 0...chars.count - 1 {
            isPalindrome[i][i] = true
            maxLength = 1
        }
        
        for i in 0...chars.count - 2 {
            if chars[i] == chars[i + 1] {
                isPalindrome[i][i + 1] = true
                maxStart = i
                maxLength = 2
            }
        }
        
        if chars.count >= 3 {
            for length in 3...chars.count {
                for i in 0...chars.count - length {
                    let j = length - 1 + i
                    if chars[i] == chars[j] && isPalindrome[i + 1][j - 1] {
                        isPalindrome[i][j] = true
                        maxStart = i
                        maxLength = length
                    }
                }
            }
        }
        
        return String(chars[maxStart...maxStart + maxLength - 1])
    }
}

// Runtime: 524ms
class Solution3 {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 && s.count <= 1000 else {
            return s
        }
        
        let chars = Array(s)
        var maxLength = 1
        var maxStart = 0
        
        for i in 0..<chars.count {
            var j = i - 1, k = i + 1
            while j >= 0 && k < chars.count && chars[j] == chars[k] {
                if k - j + 1 > maxLength {
                    maxLength = k - j + 1
                    maxStart = j
                }
                j -= 1
                k += 1
            }
        }
        
        for i in 0..<chars.count {
            var j = i, k = i + 1
            while j >= 0 && k < chars.count && chars[j] == chars[k] {
                if k - j + 1 > maxLength {
                    maxLength = k - j + 1
                    maxStart = j
                }
                j -= 1
                k += 1
            }
        }
        
        return String(chars[maxStart...maxStart + maxLength - 1])
    }
}

// Runtime: 68ms
class Solution4 {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 && s.count <= 1000 else {
            return s
        }
        
        var chars = [Character]()
        chars.append("~")
        for char in s {
            chars.append("#")
            chars.append(char)
        }
        chars.append("#")
        chars.append("+")
        
        var maxPoint = 0, rightMax = 0, middlePoint = 0
        var lenArray = Array(repeating: 1, count: chars.count)
        
        for i in 1..<2 * s.count + 2 {
            if rightMax > i {
                lenArray[i] = min(rightMax - i, lenArray[2 * middlePoint - i])
            }
            
            while chars[i - lenArray[i]] == chars[i + lenArray[i]] {
                lenArray[i] += 1
            }
            
            if lenArray[i] + i > rightMax {
                middlePoint = i
                rightMax = lenArray[i] + i
            }
            
            if lenArray[i] > lenArray[maxPoint] {
                maxPoint = i
            }
        }
        
        return String(chars[maxPoint - lenArray[maxPoint] + 1...maxPoint + lenArray[maxPoint] - 1].filter { $0 != "~" && $0 != "#" && $0 != "+" })
    }
}



