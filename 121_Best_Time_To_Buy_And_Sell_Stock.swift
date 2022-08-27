import Foundation

enum LC_121_Best_Time_To_Buy_And_Sell_Stock {

    class Solution {

        func maxProfit(_ prices: [Int]) -> Int {
            guard prices.count > 1 else {
                return 0
            }

            var maxProfit = 0
            var minPrice = Int.max

            prices.forEach { price in
                minPrice = min(minPrice, price)
                maxProfit = max(maxProfit, price - minPrice)
            }

            return maxProfit
        }

    }

}