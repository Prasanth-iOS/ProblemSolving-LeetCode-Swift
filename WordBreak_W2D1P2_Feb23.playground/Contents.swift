//MARK: - Word Break

// Link: https://leetcode.com/problems/word-break/
// Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.


//MARK: - Approach

// The idea is to apply dynamic programming as follows,

//1. Create a dp array of size 'n + 1', considering 'n' to be the length of the given string.
//2. Initialize the dp array with false. Only, the last index of the dp array is kept as True, since the null string will always be present in the dictionary.
//3. Run a for-loop through i which starts from last element of the given string, and go through the entire string. Maintain 'currIndex' to form substring for the respective iteration.
//4. Run another for-loop for itertaing through each word in the dictionary. Inside the loop, for each word, check if the substring s[currIndex..<endIndex] can be formed and the substring is mathcing the word.
//6. If substring is present, then mark dp[i] as dp[i + word.count] and if dp[i] is True, break from the loop.
//7. Finally, return the value present at the 0th index of the dp array. If it is True, then yes the wordbreak can be formed, otherwise, no the wordbreak cannot be formed.


//MARK: - Complexity

//- Time complexity:
// O(n3)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        dp[s.count] = true
        var currIndex = s.index(before: s.endIndex)
        
        for i in stride(from: s.count - 1, to: -1, by: -1) {
            for word in wordDict {
                let endIndex = s.index(currIndex, offsetBy: word.count, limitedBy: s.endIndex) ?? s.endIndex
                if (i + word.count) <= s.count && s[currIndex..<endIndex] == word {
                    dp[i] = dp[i + word.count]
                }
                if dp[i] == true {
                    break
                }
            }
            currIndex = s.index(currIndex, offsetBy: -1, limitedBy: s.startIndex) ?? s.startIndex
        }
        return dp[0]
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. s = "leetcode", wordDict = ["leet","code"]
solution.wordBreak("leetcode", ["leet","code"]) // true

//2. s = "applepenapple", wordDict = ["apple","pen"]
solution.wordBreak("applepenapple", ["apple","pen"]) // true

//3. s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
solution.wordBreak("catsandog", ["cats","dog","sand","and","cat"]) // false
