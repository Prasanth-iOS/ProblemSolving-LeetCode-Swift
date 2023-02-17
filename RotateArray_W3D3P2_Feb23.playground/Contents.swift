//MARK: - Rotate Array

// https://leetcode.com/problems/rotate-array/
// Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.


//MARK: - Approach

// The idea is to reverse the whole array and then reverse the parts of it divided by 'k'
// 'k' should be calculated by doing modulo with the total count of array to have the required iterations, since k == count will result with array with no modifications.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count

        _reverse(&nums, 0, nums.count - 1)
        _reverse(&nums, 0, k - 1)
        _reverse(&nums, k, nums.count - 1)
    }

    private func _reverse(_ nums: inout [Int], _ startIdx: Int, _ endIdx: Int) {
        var startIdx = startIdx, endIdx = endIdx

        while startIdx < endIdx {
            (nums[startIdx], nums[endIdx]) = (nums[endIdx], nums[startIdx])
            startIdx += 1
            endIdx -= 1
        }
    }
}

//MARK: - Testing Sample Data

let solution = Solution()

//1. nums = [1,2,3,4,5,6,7], k = 3
var input1 = [1,2,3,4,5,6,7]
solution.rotate(&input1, 3) // [5,6,7,1,2,3,4]

//2. nums = [-1,-100,3,99], k = 2
var input2 = [-1,-100,3,99]
solution.rotate(&input2, 2) // [3,99,-1,-100]

//3. nums = [1], k = 3
var input3 = [1]
solution.rotate(&input3, 3) // [1]

