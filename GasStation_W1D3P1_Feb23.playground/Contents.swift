//MARK: - Gas Station

// Link: https://leetcode.com/problems/gas-station/
// There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i].
// You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station. You begin the journey with an empty tank at one of the gas stations.
// Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is guaranteed to be unique


//MARK: - Approach

//1. Use remainingFuel and totalFuel to keep track of the gas and cost, change index when remainingFuel is less than 0


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var remainingFuel = 0, totalFuel = 0, index = 0
        for i in 0..<gas.count {
            remainingFuel += gas[i] - cost[i]
            if remainingFuel < 0 {
                totalFuel += remainingFuel
                remainingFuel = 0
                index = i + 1
            }
        }
        totalFuel += remainingFuel
        
        return totalFuel >= 0 ? index : -1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. gas = [1,2,3,4,5], cost = [3,4,5,1,2]
solution.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]) // 3

//2. gas = [2,3,4], cost = [3,4,3]
solution.canCompleteCircuit([2,3,4], [3,4,3]) // -1
