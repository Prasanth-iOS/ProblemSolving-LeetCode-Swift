//MARK: - Maximum Product Subarray

// Link: https://leetcode.com/problems/maximum-product-subarray/
// Given an integer array nums, find a subarray that has the largest product, and return the product.
// The test cases are generated so that the answer will fit in a 32-bit integer.


//MARK: - Approach

//1. Create a variable max_global initialized to nums[0] to hold the maximum product.
//2. Two variables max_soFar and max_soFar, which represent the highest and lowest product so far, should be initialized with nums[0].
//3. Update max_soFar with maximum of max_soFar * nums[i], min_soFar * nums[i] and nums[i].
//4. Update min_soFar with max of max_soFar * nums[i], min_soFar * nums[i], nums[i].
//5. Update max_global with maximum of max_global and max_soFar.
//6. Return max_global.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var min_soFar = nums[0]
        var max_soFar = nums[0]
        var max_global = nums[0]
        
        for i in 1..<nums.count {
            var a = max_soFar * nums[i]
            var b = min_soFar * nums[i]
            
            max_soFar = max(a, b, nums[i])
            min_soFar = min(a, b, nums[i])
            
            max_global = max(max_global, max_soFar)
        }
        return max_global
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [2,3,-2,4]
solution.maxProduct(input1) // 6

//2.
var input2 = [-2,0,-1]
solution.maxProduct(input2) // 0

//3.
var input3 = [-2,0,-2,-4]
solution.maxProduct(input3) // 8
