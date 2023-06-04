//MARK: - Palindrome Partitioning

// Link: https://leetcode.com/problems/combinations/
// Given two integers n and k, return all possible combinations of k numbers chosen from the range [1, n].
// You may return the answer in any order.


//MARK: - Approach

//1. Classic dfs with,
    //1.1 Choice: a integer array to recurse on
    //1.2 Constrints: the combination should be of length 'k'
    //1.3 Goal: decompose whole array(i.e., terminate when the pointer runs over the array)


//MARK: - Complexity

//- Time complexity:
// O(n2^n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var combination = [Int](), combinations = [[Int]]()
        backTrack(n, k, &combination, &combinations, 1)
        return combinations
    }

    private func backTrack(_ n: Int, _ k: Int, _ combination: inout [Int], _ combinations: inout [[Int]], _ idx: Int) {
        if combination.count == k {
            combinations.append(combination)
            return
        }
        for i in idx..<n+1 {
            combination.append(i)
            backTrack(n, k, &combination, &combinations, i + 1)
            combination.removeLast()
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
solution.combine(4, 2) // [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]

//2.
solution.combine(1, 1) // [[1]]
