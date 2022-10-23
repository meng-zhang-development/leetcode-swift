import Foundation

enum LC_1_Two_Sum {

    // O(n²)
    class Solution_On² {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            for i in 0 ..< nums.count {
                for j in i+1 ..< nums.count where target == (nums[i] + nums[j]) {
                    return [i, j]
                }
            }

            return []
        }
    }

    // O(n)
    class Solution_On {
        var dict = [Int: Int]()

        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            for (i, v1) in nums.enumerated() {
                let v2 = target - v1

                if let j = dict[v2] {
                    return [j, i]
                } else {
                    dict[v1] = i
                }
            }

            return []
        }
    }

}