class Solution {
    // sliding window
    static func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var sum = 0
        var ans = Int.max
        for right in 0..<nums.count {
            sum += nums[right]
            while sum >= target {
                ans = min(ans, right + 1 - left)
                sum -= nums[left]
                left += 1
            }
        }
        
        return ans == Int.max ? 0 : ans
    }
}

print(Solution.minSubArrayLen(7, [2,3,1,2,4,3]))
print(Solution.minSubArrayLen(4, [1,4,4]))
print(Solution.minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
print(Solution.minSubArrayLen(213, [12,28,83,4,25,26,25,2,25,25,25,12]))
