/*  12. Integer to Roman
    Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 
    Symbol       Value
    I             1
    V             5
    X             10
    L             50
    C             100
    D             500
    M             1000
    For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

    Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

    I can be placed before V (5) and X (10) to make 4 and 9.
    X can be placed before L (50) and C (100) to make 40 and 90.
    C can be placed before D (500) and M (1000) to make 400 and 900.
    Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.

    Example 1:

    Input: 3
    Output: "III"
 
    Example 2:

    Input: 4
    Output: "IV"
 
    Example 3:

    Input: 9
    Output: "IX"
 
    Example 4:

    Input: 58
    Output: "LVIII"
    Explanation: C = 100, L = 50, XXX = 30 and III = 3.
 
    Example 5:

    Input: 1994
    Output: "MCMXCIV"
    Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
*/

import Foundation

// Runtime: 80ms
class Solution1 {
    func intToRoman(_ num: Int) -> String {
        guard num >= 1 && num <= 3999 else {
            return String(num)
        }
        
        let thousands = ["", "M", "MM", "MMM"]
        let hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        let ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        
        return thousands[num / 1000] + hundreds[num % 1000 / 100] + tens[num % 100 / 10] + ones[num % 10]
    }
}

// Runtime: 84ms
class Solution2 {
    func intToRoman(_ num: Int) -> String {
        guard num >= 1 && num <= 3999 else {
            return String(num)
        }
        
        let nums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var number = num
        var index = 0
        var romanString = ""
        
        while number > 0 {
            let current = number / nums[index]
            
            for _ in 0..<current {
                romanString += symbols[index]
            }
            
            number -= nums[index] * current
            index += 1
        }
        
        return romanString
    }
}

// Runtime: 108ms
class Solution3 {
    func intToRoman(_ num: Int) -> String {
        guard num >= 1 && num <= 3999 else {
            return String(num)
        }
        
        let nums = [1000, 500, 100, 50, 10, 5, 1]
        let symbols = ["M", "D", "C", "L", "X", "V", "I"]
        var number = num
        var romanString = ""
        
        for n in stride(from: 0, to: 7, by: 2) {
            let x = number / nums[n]
            if x == 0 {
                continue
            }
            if x < 4 {
                for i in 1...x {
                    romanString += symbols[n]
                }
            } else if x == 4 {
                romanString = romanString + symbols[n] + symbols[n-1]
            } else if x > 4 && x < 9 {
                romanString += symbols[n-1]
                if x >= 6 {
                    for i in 6...x {
                        romanString += symbols[n]
                    }
                }
            } else if x == 9 {
                romanString = romanString + symbols[n] + symbols[n-2]
            }
            number %= nums[n]
        }
        
        return romanString
    }
}


