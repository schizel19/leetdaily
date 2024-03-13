class Solution {
    static func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var runningMax = 0
        var runningCounter = 0
        for num in nums {
            if num == 1 {
                runningCounter += 1
            } else {
                runningMax = max(runningMax, runningCounter)
                runningCounter = 0
            }
        }
        return max(runningMax, runningCounter)
    }
}

print(Solution.findMaxConsecutiveOnes([1,1,0,1,1,1]))
