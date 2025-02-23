/*:
 ## Greatest Common Divisor of Strings
 For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).

 Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.
 ```
 Input: str1 = "ABABAB", str2 = "ABAB"
 Output: "AB"
 ```
 [**Link**](https://leetcode.com/problems/greatest-common-divisor-of-strings/description/?envType=study-plan-v2&envId=leetcode-75)
 */
import Foundation

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        let l1 = str1.count
        let l2 = str2.count
        
        // Check if a substring of length 'len' can be a divisor of both strings
        func isDivisor(_ len: Int) -> Bool {
            if l1 % len == 0 && l2 % len == 0 {
                let f1 = l1 / len
                let f2 = l2 / len
                
                // calculate endIndex for both str1 and str2
                let endIndex = str1.index(str1.startIndex, offsetBy: len)
                let substring = String(str1[..<endIndex])
                
                // Check if repeating this substring reconstructs both strings
                if String(repeating: substring, count: f1) == str1 && String(repeating: substring, count: f2) == str2 {
                    return true
                }
            }
            return false
        }
        
        // Loop from the minimum length downwards to find the greatest divisor
        for i in stride(from: min(l1, l2), through: 1, by: -1) {
            if isDivisor(i) {
                let endIndex = str1.index(str1.startIndex, offsetBy: i)
                return String(str1[..<endIndex])
            }
        }
        
        // If no common divisor is found, return an empty string
        return ""
    }
}

let str1 = "Lett", str2 = "ABAB"
Solution().gcdOfStrings(str1, str2)

/*:
 Using Stride to run loop max to min
 `for i in stride(from: min(l1, l2), through: 1, by: -1)`
 
 
 GCD func
 ```
 func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
 }
 ```
 */
