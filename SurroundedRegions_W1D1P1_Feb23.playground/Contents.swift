//MARK: - Surrounded Regions

// Link: https://leetcode.com/problems/surrounded-regions/
// Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.
// A region is captured by flipping all 'O's into 'X's in that surrounded region.


//MARK: - Approach

//1. Traverse the four edges of given matrix and replace all ‘O’ and its connected "O" with a 'E' by applying DFS on all four directions on each occurence of 'O'.
//2. Traverse the matrix and replace all ‘O‘s and 'E's with ‘X’s and 'O's respectively.


//MARK: - Complexity

//- Time complexity:
// O(mn)
//
//- Space complexity:
// O(mn)


//MARK: - Code

import Foundation

class Solution {
    func solve(_ board: inout [[Character]]) {
        for i in 0..<board.count {
            if board[i][0] == "O" {
                dfs(&board, i, 0)
            }
            if board[i][board[0].count - 1] == "O" {
                dfs(&board, i, board[0].count - 1)
            }
        }

        for j in 0..<board[0].count {
            if board[0][j] == "O" {
                dfs(&board, 0, j)
            }
            if board[board.count - 1][j] == "O" {
                dfs(&board, board.count - 1, j)
            }
        }

        for i in 0..<board.count {
            for j in 0..<board[0].count where board[i][j] != "x" {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }
                if board[i][j] == "E" {
                    board[i][j] = "O"
                }
            }
        }
    }

    private func dfs(_ board: inout[[Character]], _ i: Int, _ j: Int) {
        guard i >= 0, i < board.count, j >= 0, j < board[0].count,
        board[i][j] != "X", board[i][j] != "E" else {
            return
        }
        
        board[i][j] = "E"

        dfs(&board, i + 1, j)
        dfs(&board, i - 1, j)
        dfs(&board, i, j + 1)
        dfs(&board, i, j - 1)
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
solution.solve(&input1) // [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]

//2.
var input2: [[Character]] = [["X"]]
solution.solve(&input2) // [["X"]]
