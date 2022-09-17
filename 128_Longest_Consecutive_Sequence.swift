import Foundation

enum LC_128_Longest_Consecutive_Sequence {

    class Solution {

        func longestConsecutive(_ nums: [Int]) -> Int {
            let set = Set(nums)
            var res = 0

            for num in nums {
                if !set.contains(num - 1) {
                    var len = 1
                    var n = num + 1

                    while set.contains(n) {
                        len += 1
                        n += 1
                    }

                    res = max(res, len)
                }
            }

            return res
        }

    }

}