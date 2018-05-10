/*  8. String to Integer (atoi)
    Implement atoi which converts a string to an integer.
 
    The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 
    The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 
    If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 
    If no valid conversion could be performed, a zero value is returned.
 
    Note:
 
    Only the space character ' ' is considered as whitespace character.
    Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
    Example 1:
 
    Input: "42"
    Output: 42
 
    Example 2:
 
    Input: "   -42"
    Output: -42
    Explanation: The first non-whitespace character is '-', which is the minus sign.
    Then take as many numerical digits as possible, which gets 42.
 
    Example 3:
 
    Input: "4193 with words"
    Output: 4193
    Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 
    Example 4:
 
    Input: "words and 987"
    Output: 0
    Explanation: The first non-whitespace character is 'w', which is not a numerical
    digit or a +/- sign. Therefore no valid conversion could be performed.
 
    Example 5:
 
    Input: "-91283472332"
    Output: -2147483648
    Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
    Thefore INT_MIN (−231) is returned.
*/

import Foundation

// Runtime: 64ms
class Solution1 {
    func myAtoi(_ str: String) -> Int {
        var chars = Array(str.trimmingCharacters(in: [" "]))
        var digitsStr = ""
        guard chars.count > 0 else {
            return 0
        }
        
        if chars.first != "-" && chars.first != "+"  && Int(String(chars.first!)) == nil {
            return 0
        } else {
            repeat {
                digitsStr.append(chars.remove(at: 0))
                if let tmpResult = Int(digitsStr) {
                    if tmpResult > Int(Int32.max) {
                        return Int(Int32.max)
                    }
                    if tmpResult < Int(Int32.min) {
                        return Int(Int32.min)
                    }
                }
            } while chars.count > 0 && Int(String(chars.first!)) != nil
        }
        
        if let result = Int(digitsStr) {
            return result
        } else {
            return 0
        }
    }
}

// Runtime: 52ms
class Solution2 {
    func myAtoi(_ str: String) -> Int {
        var chars = Array(str.trimmingCharacters(in: [" "]))
        var index = 0, flag = 1, res = 0
        guard chars.count > 0 else {
            return 0
        }
        
        if chars[index] == "-" {
            flag = -1
            index += 1
        } else if chars[index] == "+" {
            index += 1
        }
        
        while index < chars.count {
            guard chars[index] >= "0" && chars[index] <= "9" else {
                break
            }
            
            res = res * 10 + Int(String(chars[index]))!
            
            if flag == 1 && res > Int(Int32.max) {
                return Int(Int32.max)
            } else if flag == -1 && res > abs(Int(Int32.min)) {
                return Int(Int32.min)
            }
            
            index += 1
        }
        
        return flag * res
    }
}

// Runtime: 36ms
class Solution3 {
    func myAtoi(_ str: String) -> Int {
        var res = 0
        var flag = 1
        var index = 0
        
        let chars = Array(str)
        while index < chars.count {
            guard chars[index] == " " else {
                break
            }
            index += 1
        }
        guard index < chars.count else {
            return res
        }
        
        if chars[index] == "-" {
            flag = -1
            index += 1
        } else if chars[index] == "+" {
            index += 1
        }
        
        while index < chars.count {
            guard isDigit(chars[index]) else {
                break
            }
            
            res = res * 10 + Int(String(chars[index]))!
            
            if res >= Int(Int32.max) {
                if flag == 1 {
                    return Int(Int32.max)
                } else if res > Int(Int32.max) && flag == -1 {
                    return Int(Int32.min)
                }
            }
            
            index += 1
        }
        
        return flag * res
    }
    
    private func isDigit(_ char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }

}
