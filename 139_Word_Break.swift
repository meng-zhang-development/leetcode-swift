import Foundation

enum LC_139_Word_Break {

    class Solution {

        func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
            let wordSet = Set(wordDict)
            let n = s.count
            var dp = [Bool](repeating: false, count: n + 1)
            dp[0] = true

            for i in 1 ... n {
                for j in 0 ..< i {
                    let start  = s.index(s.startIndex, offsetBy: j)
                    let end  = s.index(s.startIndex, offsetBy: i)
                    let subStr = String(s[start ..< end])

                    if wordSet.contains(subStr) && dp[j] {
                        dp[i] = true
                        break
                    }
                }
            }

            return dp[n]
        }

    }

}