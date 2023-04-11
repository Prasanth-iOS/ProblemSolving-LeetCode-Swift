//MARK: - Find Peak Element

// https://leetcode.com/problems/find-peak-element/
// A peak element is an element that is strictly greater than its neighbors.
// Given a 0-indexed integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.
// You may imagine that nums[-1] = nums[n] = -∞. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.
// You must write an algorithm that runs in O(log n) time.


//MARK: - Approach

// Classic Binary Search, iterate until left is less than right.
// When nums[mid] > nums[mid + 1], assign 'mid' to 'right'
// Else, assign 'mid' + 1 to left
// Return left


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1, mid = 0
        
        while left < right {
            mid = (right - left) / 2 + left
            
            if nums[mid] > nums[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
let input1 = [1,2,3,1]
solution.findPeakElement(input1) // 2

//2.
let input2 = [1,2,1,3,5,6,4]
solution.findPeakElement(input2) // 5

//3.
let input3 = [2,1]
solution.findPeakElement(input3) // 0

//4.
let input4 = [1]
solution.findPeakElement(input4) // 0

