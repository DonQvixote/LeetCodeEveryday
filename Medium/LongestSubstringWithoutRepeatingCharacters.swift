/*  3. Longest Substring Without Repeating Characters
    Given a string, find the length of the longest substring without repeating characters.
 
    Examples:
 
    Given "abcabcbb", the answer is "abc", which the length is 3.
 
    Given "bbbbb", the answer is "b", with the length of 1.
 
    Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
*/

import Foundation

// Time Limit Exceeded
class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        if s.count == 1 {
            return 1
        }
        
        var maxLength = 0
        var chars = Array(s)
        
        for i in 0..<chars.count {
            for j in i+1..<chars.count {
                var isRepeat = false
                for k in i..<j {
                    if chars[k] == chars[j] {
                        isRepeat = true
                        break
                    }
                }
                if isRepeat {
                    break
                } else if j - i > maxLength {
                    maxLength = j - i
                }
            }
        }
        
        return maxLength
    }

}

// Runtime: 104ms
class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var set = Set<Character>()
        var maxLength = 0, left = 0
        
        for (i, char) in chars.enumerated() {
            if set.contains(char) {
                maxLength = max(maxLength, i - left)
                while chars[left] != char {
                    set.remove(chars[left])
                    left += 1
                }
                left += 1
                
            } else {
                set.insert(char)
            }
        }
        
        return max(maxLength, chars.count - left)
    }
}

// Runtime: 96ms
class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var chars = Array(s)
        var hashMap = [Character: Int]()
        var maxLength = 0, tmpMaxLen = 0
        
        for (i, char) in chars.enumerated() {
            if let left = hashMap[char] {
                if left < i - tmpMaxLen {
                    tmpMaxLen += 1
                } else {
                    tmpMaxLen = i - left
                }
            } else {
                tmpMaxLen += 1
            }
            hashMap[char] = i
            maxLength = max(maxLength, tmpMaxLen)
        }
        return maxLength
    }
}

