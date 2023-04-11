//MARK: - Palindrome Partitioning

// Link: https://leetcode.com/problems/palindrome-partitioning/
// Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.


//MARK: - Approach

//1. Classic dfs with,
    //1.1 Choice: a string to recurse on
    //1.2 Constrints: the string should be a palindrome
    //1.3 Goal: decompose whole string(i.e., terminate when the pointer runs over the string)


//MARK: - Complexity

//- Time complexity:
// O(n2^n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func partition(_ s: String) -> [[String]] {
        var paths = [[String]](), path = [String]()
        
        dfs(&paths, &path, Array(s), 0)
        
        return paths
    }
    
    fileprivate func dfs(_ paths: inout [[String]], _ path: inout [String], _ s: [Character], _ index: Int) {
        if index == s.count {
            paths.append(path)
            return
        }
        
        for i in index..<s.count {
            let current = String(s[index...i])
            
            if current.isPalindrome {
                path.append(current)
                dfs(&paths, &path, s, i + 1)
                path.removeLast()
            }
        }
    }
}

extension String {
    var isPalindrome: Bool {
        let chars = Array(self)
        
        var i = 0, j = count - 1
        
        while i <= j {
            if chars[i] != chars[j] {
                return false
            }
            i += 1
            j -= 1
        }
        
        return true
    }
}



//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "aab"
solution.partition(input1) // [["a","a","b"],["aa","b"]]

//2.
var input2 = "a"
solution.partition(input2) // [["a"]]

//3.
var input3 = "abaabb"
solution.partition(input3) // [["a","b","a","a","b","b"],["a","b","a","a","bb"],["a","b","aa","b","b"],["a","b","aa","bb"],["a","baab","b"],["aba","a","b","b"],["aba","a","bb"]]
