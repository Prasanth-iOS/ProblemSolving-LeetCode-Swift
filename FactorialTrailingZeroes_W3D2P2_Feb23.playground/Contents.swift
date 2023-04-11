//MARK: - Factorial Trailing Zeroes

// https://leetcode.com/problems/factorial-trailing-zeroes/
// Given an integer n, return the number of trailing zeroes in n!.


//MARK: - Approach

// The idea is to calculate the total number of 5's in the given number. i.e., 5! = 120 = 1. 10! = 3628800 = 2.
// Because every 0's in a product should be a multiple of 10. i.e., 24 * 10 = 240
    // For a 10!, there are two 10's which is (2 * 5, 10) or find multiples of 5's which is (5, 10).


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        return n > 0 ? n / 5 + trailingZeroes(n / 5) : 0
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
solution.trailingZeroes(3) // 0

//2.
solution.trailingZeroes(5) // 1

//3.
solution.trailingZeroes(10) // 2

//4.
solution.trailingZeroes(0) // 0

