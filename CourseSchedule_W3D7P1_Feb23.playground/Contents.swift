//MARK: - Course Schedule

// https://leetcode.com/problems/course-schedule/
// There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.


//MARK: - Approach

// Using DFS, mantain the dependency list for each course and a visitedSet for the visited courses to avoid loop.
// Iterate through the courses, and apply dfs for the current course.
// For dfs,
    // Return false, if it a visited course or return true, when the dependency list is empty
    // Add the course to visited list
    // Apply dfs for each course in the dependency list, and return false if the dfs returned false.
    // Remove the course from visited list once the loop completes.
    // Also, set the dependency list to empty since we have successfully completed dfs for the all dependencies
    // Return true
// Return false, if any course returned false with dfs.
// Return true once the loop completes successfully.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var preMap = Array(repeating: [Int](), count: numCourses)
        var visitedSet = Set<Int>()
        for prerequisite in prerequisites {
            preMap[prerequisite[0]].append(prerequisite[1])
        }
        for i in 0..<numCourses {
            if !dfs(i, &preMap, &visitedSet) {
                return false
            }
        }
        return true
    }
    
    private func dfs(_ course: Int, _ preMap: inout [[Int]], _ visitedSet: inout Set<Int>) -> Bool {
        if visitedSet.contains(course) {
            return false
        }
        if preMap[course].isEmpty {
            return true
        }
        
        visitedSet.insert(course)
        
        for prequisite in preMap[course] {
            if !dfs(prequisite, &preMap, &visitedSet) {
                return false
            }
        }
        visitedSet.remove(course)
        preMap[course] = []
        return true
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. numCourses = 2, prerequisites = [[1,0]]
solution.canFinish(2, [[1,0]]) // true

//2. numCourses = 2, prerequisites = [[1,0],[0,1]]
solution.canFinish(2, [[1,0],[0,1]]) // false

//3. numCourses = 3, prerequisites = [[1,2],[2,3]]
solution.canFinish(3, [[1,2],[0,2]]) // true

//4. numCourses = 1, prerequisites = [[]]
solution.canFinish(1, [[Int]]()) // true

