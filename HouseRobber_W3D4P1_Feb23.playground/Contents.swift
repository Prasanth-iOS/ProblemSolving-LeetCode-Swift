//MARK: - House Robber

// https://leetcode.com/problems/house-robber/
// You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
// Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.


//MARK: - Approach

// The idea is to use dynamic programming and calculate maximum amount for each index
// The maximum amount for current index can be calculated by max(adjacent max amount + current amount, previous max amount)
// Return the amount of the last index.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var rob1 = 0, rob2 = 0
        for num in nums {
            let temp = max(rob1 + num, rob2)
            rob1 = rob2
            rob2 = temp
        }
        return rob2
    }
}

//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [1,2,3,1]
solution.rob(input1) // 4

//2.
var input2 = [2,7,9,3,1]
solution.rob(input2) // 12

//3.
var input3 = [1]
solution.rob(input3) // 1

