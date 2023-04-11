//MARK: - Count Primes

// https://leetcode.com/problems/count-primes/
// Given an integer n, return the number of prime numbers that are strictly less than n.


//MARK: - Approach

// Using Sieve of Eratosthenes alogrithm, maintiain an array initialized to true of n count.
// Just iterate from 2 when i^2 < n.
// If 'i' is a prime(check with the array i == true), iterate with an inner loop starting from i^2 and incremented by 'i' for each iteration, set the element to 'false'.
// Return the number of elements with value 'true'.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 2 {
            return 0
        }
        var isPrime = Array(repeating: true, count: n)
        var i = 2
        while (i * i) < n {
            if isPrime[i] == true {
                var j = i * i
                while j < n {
                    isPrime[j] = false
                    j = j + i
                }
            }
            i += 1
        }
        var count = 0
        for i in 2..<n where isPrime[i] == true {
            count += 1
        }
        return count
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = 10
solution.countPrimes(input1) // 4

//2.
var input2 = 0
solution.countPrimes(input2) // 0

//3.
var input3 = 1
solution.countPrimes(input3) // 0

//4.
var input4 = 4
solution.countPrimes(input4) // 2

