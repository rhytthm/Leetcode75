/*:
 ## Can Place Flowers
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.
 ```
 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
 ```
 [**Link**](https://leetcode.com/problems/can-place-flowers/description/?envType=study-plan-v2&envId=leetcode-75)
 */
import Foundation

final class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var i = 0
        var count = 0
        var flowerbed = flowerbed
        // While loop to iterate through the flowerbed
        while i < flowerbed.count {
            // Check if the current plot is empty (flowerbed[i] == 0)
            // and if its neighbors are also empty or out of bounds
            if flowerbed[i] == 0 &&
                (i == 0 || flowerbed[i - 1] == 0) &&  // Check left neighbor or first plot
                (i == flowerbed.count - 1 || flowerbed[i + 1] == 0) {  // Check right neighbor or last plot
                
                flowerbed[i] = 1  // Place a flower at the current index
                count += 1  // Increment the count of placed flowers
            }
            
            i += 1  // Move to the next index
        }
        // Return true if the number of placed flowers is greater than or equal to 'n'
        return count >= n
    }
}

let flowerbed = [0,0,0,0,1], n = 2
Solution().canPlaceFlowers(flowerbed, n)
