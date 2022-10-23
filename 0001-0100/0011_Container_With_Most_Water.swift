import Foundation

enum LC_11_Container_With_Most_Water {

    class Solution {

        func maxArea(_ height: [Int]) -> Int {
            guard height.count > 1 else {
                return 0
            }

            var l = 0
            var r = height.count - 1
            var res = 0

            while l < r {
                let currValue = (r - l) * min(height[l], height[r])
                res = max(res, currValue)

                if height[l] > height[r] {
                    r -= 1
                } else {
                    l += 1
                }
            }

            return res
        }

    }

}