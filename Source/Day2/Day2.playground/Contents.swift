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
    
    // simple
    static func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map { $0 * $0 }.sorted()
    }
    
    // optimized
    static func sortedSquares2(_ nums: [Int]) -> [Int] {
        var right = nums.count - 1
        var left = 0
        
        var result = nums
        var index = right

        while index >= 0 {
            if abs(nums[left]) < abs(nums[right]) {
                result[index] = nums[right] * nums[right]
                right -= 1
            } else {
                result[index] = nums[left] * nums[left]
                left += 1
            }
            index -= 1
        }
        
        return result
    }
    
}

print(Solution.findMaxConsecutiveOnes([1,1,0,1,1,1]))
print(Solution.findNumbers([555,901,482,1771]))
print(Solution.sortedSquares([-7,-3,2,3,11]))
print(Solution.sortedSquares2([-7,-3,2,3,11]))
