/*  11. Container With Most Water
    Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
    Note: You may not slant the container and n is at least 2.
*/

import Foundation

// Time Limit Exceeded
class Solution1 {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count >= 2 else {
            return 0
        }
        
        var maxArea = 0
        
        for i in 0..<height.count {
            for j in i+1..<height.count {
                let containerHeight = min(height[i], height[j])
                maxArea = max(maxArea, containerHeight * (j - i))
            }
        }
        return maxArea
    }
}

// Runtime: 36ms
class Solution2 {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count >= 2 else {
            return 0
        }
        
        var left = 0, right = height.count - 1
        var maxArea = 0
        
        while left < right {
            let containerHeight = min(height[left], height[right])
            maxArea = max(maxArea, containerHeight * (right - left))
            
            if containerHeight == height[left] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}
