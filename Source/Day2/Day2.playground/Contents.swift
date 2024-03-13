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
    
    // simple
    static func findNumbers(_ nums: [Int]) -> Int {
        return nums.filter { String($0).count % 2 == 0 }.count
    }
    
}

print(Solution.findMaxConsecutiveOnes([1,1,0,1,1,1]))
print(Solution.findNumbers([555,901,482,1771]))
