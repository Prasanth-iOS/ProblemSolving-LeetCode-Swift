//MARK: - Min Stack

// Link: https://leetcode.com/problems/min-stack/
// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
// Implement the MinStack class:
// MinStack() initializes the stack object.
// void push(int val) pushes the element val onto the stack.
// void pop() removes the element on the top of the stack.
// int top() gets the top element of the stack.
// int getMin() retrieves the minimum element in the stack.
// You must implement a solution with O(1) time complexity for each function.


//MARK: - Approach

// The idea is to store all elements in a array 'stack' to perform all stack operations and at the same time maintain another array 'minStack' to store the minimum values. The 'minstack' accepts elements when it is either empty or the element is less than the last element it holds. When an element is popped, the minStack also removes the element if it is same as the popped the element.


//MARK: - Complexity

//- Time complexity:
// O(1)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class MinStack {
    var stack: [Int]
    var minStack: [Int]

    init() {
        stack = [Int]()
        minStack = [Int]()
    }
    
    func push(_ val: Int) {
        stack.append(val)
        if minStack.isEmpty || val <= minStack.last! {
            minStack.append(val)
        }
    }

    func pop() {
        guard !stack.isEmpty else {
            return
        }
        let removedVal = stack.removeLast()
        if let last = minStack.last, last == removedVal {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        stack.isEmpty ? -1 : stack.last!
    }
    
    func getMin() -> Int {
        minStack.isEmpty ? -1 : minStack.last!
    }
}


//MARK: - Testing Sample Data

//1. ["MinStack","push","push","push","getMin","pop","top","getMin"]
//   [[],[-2],[0],[-3],[],[],[],[]]
let minStack = MinStack()
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
minStack.getMin() // return -3
minStack.pop()
minStack.top()    // return 0
minStack.getMin() // return -2
