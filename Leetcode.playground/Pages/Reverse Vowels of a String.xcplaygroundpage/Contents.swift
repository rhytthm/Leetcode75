/*:
 ## Reverse Vowels of a String
 Given a string s, reverse only all the vowels in the string and return it.

 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
 ```
 Input: s = "IceCreAm"

 Output: "AceCreIm"

 Explanation:

 The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".
 ```
 [**Link**](https://leetcode.com/problems/reverse-vowels-of-a-string/description/?envType=study-plan-v2&envId=leetcode-75)
 */
import Foundation

class Solution {
    enum Vowel: Character {
        case a = "a"
        case e = "e"
        case i = "i"
        case o = "o"
        case u = "u"
    }
    
    func isVowel(_ char: Character) -> Bool {
        // Ensure the character is alphabetic before checking if it's a vowel
        return Vowel(rawValue: Character(String(char).lowercased())) != nil
    }
    
    func reverseVowels(_ s: String) -> String {
        var vowelArray: [Character] = []
        var resultArray: [Character] = Array(s)  // Initialize the result array with the original string
        
        // Collect vowels and leave other characters in place (spaces and consonants stay)
        for char in resultArray {
            if isVowel(char) {
                vowelArray.append(char)  // Collect the vowels
            }
        }
        
        vowelArray.reverse()  // Reverse the collected vowels
        
        // Replace vowels in resultArray with reversed vowels
        var vowelIndex = 0
        for i in 0..<resultArray.count {
            if isVowel(resultArray[i]) {
                resultArray[i] = vowelArray[vowelIndex]
                vowelIndex += 1
            }
        }
        
        return String(resultArray)  // Convert the character array back to a string
    }
}
var s = "a a"
Solution().reverseVowels(s)


