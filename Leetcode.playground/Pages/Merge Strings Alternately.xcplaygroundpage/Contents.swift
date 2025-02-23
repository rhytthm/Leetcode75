/*:
 ## Merge String Alternately
You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. If a string is longer than the other, append the additional letters onto the end of the merged string.
Return the merged string.
 ```
 Input: word1 = "abc", word2 = "pqr"
 Output: "apbqcr"
 Explanation: The merged string will be merged as so:
 word1:  a   b   c
 word2:    p   q   r
 merged: a p b q c r
 ```
 [**Link**](https://leetcode.com/problems/merge-strings-alternately/description/?envType=study-plan-v2&envId=leetcode-75)
 */
import Foundation
class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result = ""
        for (char1, char2) in zip(word1, word2) {
            result += [char1, char2]
        }
        if word1.count < word2.count {
            result += word2[word1.endIndex...]
        } else {
            result += word1[word2.endIndex...]
        }
        return result
    }
}

var word1 = "abc"
var word2 = "pqrabc"
let output = Solution().mergeAlternately(word1, word2)
