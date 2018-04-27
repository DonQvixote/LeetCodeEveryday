/*  1. Two Sum
    Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
    You may assume that each input would have exactly one solution, and you may not use the same element twice.

	Example:

	Given nums = [2, 7, 11, 15], target = 9,

	Because nums[0] + nums[1] = 2 + 7 = 9,
	return [0, 1].
*/

import Foundation

// Runtime: 556ms
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
	    for i in 0...(nums.count-1) {
	        for j in (i+1)...(nums.count-1) {
	            if nums[i] + nums [j] == target {
	                return [i, j]
	            }
	        }
	    }
	    fatalError("No valid outputs")
	}
}

// Runtime: 20ms
class Solution2 {
    func twoSum(_ nums: [Int],_ target: Int) -> [Int] {
        var indices = [Int]()
        var hashMap = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            guard let otherIndex = hashMap[target - num] else {
                hashMap[num] = i
                continue
            }
            
            indices.append(otherIndex)
            indices.append(i)
        }

        return indices
    }
}

// Runtime: 16ms
class Solution3 {
    func twoSum(_ nums: [Int],_ target: Int) -> [Int] {
        var hashMap = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            if let otherIndex = hashMap[target - num] {
                return [i, otherIndex]
            }
            
            hashMap[num] = i
        }
        
        fatalError("No valid outputs")
    }
}
