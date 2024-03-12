import UIKit

class Solution {
    /// simple
    static func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        var running = [Int]()
        for num in nums {
            sum += num
            running.append(sum)
        }
        return running
    }
    
    /// functional
    static func runningSum2(_ nums: [Int]) -> [Int] {
        return nums.reduce(into: []) { newArr, num in
            newArr.append(num + (newArr.last ?? 0))
        }
    }
    
    /// simple
    static func maximumWealth(_ accounts: [[Int]]) -> Int {
        return accounts.map { $0.reduce(0, +) }.max()!
    }
}

print(Solution.runningSum([1,2,3,4]))
print(Solution.runningSum2([1,2,3,4]))
print(Solution.runningSum([5,10,35,50]))
print(Solution.runningSum2([5,10,35,50]))
print(Solution.maximumWealth([[1,2,3],[3,2,1]]))

