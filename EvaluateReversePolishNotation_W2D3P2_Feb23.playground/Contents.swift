//MARK: - Evaluate Reverse Polish Notation

// Link: https://leetcode.com/problems/evaluate-reverse-polish-notation/
// You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.
// Evaluate the expression. Return an integer that represents the value of the expression.


//MARK: - Approach

//1. The idea is to maintain a stack to push numbers into it. When an operator is encountered, pop the first two numbers, do the appropriate arithmatic operation and push the result to stack.
//2. Return first element of the stack.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for i in 0..<tokens.count{
            let value = tokens[i]
            if value == "+" {
                stack.append(stack.popLast()! + stack.popLast()!)
            } else if value == "-" {
                let a = stack.popLast()!, b = stack.popLast()!
                stack.append(b - a)
            } else if value == "*" {
                stack.append(stack.popLast()! * stack.popLast()!)
            } else if value == "/" {
                let a = stack.popLast()!, b = stack.popLast()!
                stack.append(b / a)
            } else {
                stack.append(Int(value) ?? 0)
            }
        }
        return stack[0]
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
let input1 = ["2","1","+","3","*"]
solution.evalRPN(input1) // 9

//2.
let input2 = ["4","13","5","/","+"]
solution.evalRPN(input2) // 6

//3.
let input3 = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
solution.evalRPN(input3) // 22

