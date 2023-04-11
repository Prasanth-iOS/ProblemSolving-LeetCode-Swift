//MARK: - Largest Number

// https://leetcode.com/problems/largest-number/
// Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.
// Since the result may be very large, so you need to return a string instead of an integer.


//MARK: - Approach

// The idea is to sort the given nums as a string by appending both the in two different orders.
// Because [3, 30] can be sorted to [30, 3] which results in "303", however when taken as "330" > "303" will give the required result as "330".
// Return "0" if the result starts with '0' for an edge case[0, 0, 0], else return the original result.


//MARK: - Complexity

//- Time complexity:
// O(nlogn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let numsSortedStr = nums.map { "\($0)" }.sorted {
            ($0 + $1) > ($1 + $0)
        }.joined()

        return numsSortedStr.first == "0" ? "0" : numsSortedStr
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
let input1 = [10,2]
solution.largestNumber(input1) // "210"

//2.
let input2 = [3,30,34,5,9]
solution.largestNumber(input2) // "9534330

//3.
let input3 = [1]
solution.largestNumber(input3) // 1

