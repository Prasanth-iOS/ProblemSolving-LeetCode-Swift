//MARK: - Number of Islands

// https://leetcode.com/problems/number-of-islands/
// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.


//MARK: - Approach

// Classic Depth-first Search, go up, down, left, right four directions to check if "1" is surrounded by "0".


//MARK: - Complexity

//- Time complexity:
// O(mn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var isVisited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var result = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" && !isVisited[i][j] {
                    dfs(grid, &isVisited, i, j)
                    result += 1
                }
            }
        }
        return result
    }

    private func dfs(_ grid: [[Character]], _ isVisited: inout [[Bool]], _ i: Int, _ j: Int) {
        if i < 0 || i > grid.count - 1 || j < 0 || j > grid[0].count - 1 || grid[i][j] == "0" || isVisited[i][j] {
            return
        }
        isVisited[i][j] = true
        dfs(grid, &isVisited, i - 1, j)
        dfs(grid, &isVisited, i + 1, j)
        dfs(grid, &isVisited, i, j - 1)
        dfs(grid, &isVisited, i, j + 1)
    }
}

//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1: [[Character]] = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
]
solution.numIslands(input1) // 1

//2.
var input2: [[Character]] = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
]
solution.numIslands(input2) // 3

