/*  4. Median of Two Sorted Arrays
    There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
    Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
    Example 1:
    nums1 = [1, 3]
    nums2 = [2]
 
    The median is 2.0
    Example 2:
    nums1 = [1, 2]
    nums2 = [3, 4]
 
    The median is (2 + 3)/2 = 2.5
*/

import Foundation

// Runtime: 120ms
class Solution1 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nums = (nums1 + nums2).sorted().map{ Double($0) }
        let count = nums.count
        if count % 2 == 0 {
            return (nums[count / 2] + nums[count / 2 - 1]) / 2
        }
        else {
            return nums[count / 2]
        }
    }
}

// Runtime: 100ms
class Solution2 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var numbers1 = nums1, numbers2 = nums2
        var nums = [Int]()
        while nums.count <= (nums1.count + nums2.count) / 2 {
            if numbers1.count == 0 {
                nums.append(numbers2.removeFirst())
            } else if numbers2.count == 0 {
                nums.append(numbers1.removeFirst())
            } else {
                if numbers1.first! > numbers2.first! {
                    nums.append(numbers2.removeFirst())
                } else {
                    nums.append(numbers1.removeFirst())
                }
            }
        }
        if (nums1.count + nums2.count) % 2 == 0 {
            return (Double(nums[nums.count - 2]) + Double(nums[nums.count - 1])) / 2
        } else {
            return Double(nums.last!)
        }
    }
}

// Runtime: 60ms
class Solution3 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        let halfLength: Int = (m + n + 1) >> 1
        var imin = 0, imax = m
        var maxOfLeft = 0, minOfRight = 0
        
        if m > n {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        while imin <= imax {
            let mid1 = (imin + imax) / 2
            let mid2 = halfLength - mid1
            if mid1 > 0 && mid2 < n && nums1[mid1 - 1] > nums2[mid2] {
                imax = mid1 - 1
            } else if mid2 > 0 && mid1 < m && nums1[mid1] < nums2[mid2 - 1] {
                imin = mid1 + 1
            } else {
                if mid1 == 0 {
                    maxOfLeft = nums2[mid2 - 1]
                } else if mid2 == 0 {
                    maxOfLeft = nums1[mid1 - 1]
                } else {
                    maxOfLeft = max(nums1[mid1 - 1], nums2[mid2 - 1])
                }
                
                if (m + n) % 2 == 1 {
                    return Double(maxOfLeft)
                }
                
                if mid1 == m {
                    minOfRight = nums2[mid2]
                } else if mid2 == n {
                    minOfRight = nums1[mid1]
                } else {
                    minOfRight = min(nums1[mid1], nums2[mid2])
                }
                break
            }
        }
        
        return Double(maxOfLeft + minOfRight) / 2
    }
}
