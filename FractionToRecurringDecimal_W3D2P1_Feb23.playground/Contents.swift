//MARK: - Fraction to Recurring Decimal

// https://leetcode.com/problems/fraction-to-recurring-decimal/
// Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
// If the fractional part is repeating, enclose the repeating part in parentheses.
// If multiple answers are possible, return any of them.
// It is guaranteed that the length of the answer string is less than 104 for all the given inputs.


//MARK: - Approach

// Get quotient and remainder, Iterate until the remainder exists, append quotient to 'result', add the numerator and index(result string count) to a 'numToIndex' dictionary. Assign (remainder * 10) to numerator at the end of each iteration.
// Manually append ".", when the remainder is not equal to 0.
// Also, manually handle adding brackets on occurence of a repeated numerator. This can be checked with the help of 'numToIndex'.
// Return result with a negative value check.


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 {
            return "0"
        }
        var isPositive = (numerator < 0) == (denominator < 0), numerator = abs(numerator), res = "", numToIndex = [Int: Int](), hasDot = false
        let denominator = abs(denominator)
        
        while numerator != 0 {
            let (q, r) = numerator.quotientAndRemainder(dividingBy: denominator)
            if let numIndex = numToIndex[numerator] {
                res.insert("(", at: res.index(res.startIndex, offsetBy: numIndex))
                res.append(")")
                break
            } else {
                res += "\(q)"
                if !hasDot && r != 0 {
                    res += "."
                    hasDot = true
                } else {
                    numToIndex[numerator] = res.count - 1
                }
            }
            numerator = r * 10
        }
        return isPositive ? res : "-" + res
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. numerator = 1, denominator = 2
solution.fractionToDecimal(1, 2) // "0.5"

//2. numerator = 2, denominator = 1
solution.fractionToDecimal(2, 1) // "2"

//3. numerator = 4, denominator = 333
solution.fractionToDecimal(4, 333) // "0.(012)"

