import Foundation

enum LC_125_Valid_Palindrome {

    class Solution {

        func isPalindrome(_ s: String) -> Bool {
            let chars = Array(s.lowercased())
            var left = 0
            var right = chars.count - 1

            while left < right {
                while left < right {
                    let c = chars[left]
                    if !c.isLetter && !c.isNumber {
                        left += 1
                    } else {
                        break
                    }
                }

                while left < right {
                    let c = chars[right]
                    if !c.isLetter && !c.isNumber {
                        right -= 1
                    } else {
                        break
                    }
                }

                if chars[left] == chars[right] {
                    left += 1
                    right -= 1
                } else {
                    return false
                }
            }

            return true
        }

    }

}