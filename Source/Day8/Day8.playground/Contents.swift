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
    
    static func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        if k == 0 { return }
        var left = 0, right = nums.count - 1
        
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        left = 0
        right = k - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        left = k
        right = nums.count - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}

print(Solution.minSubArrayLen(7, [2,3,1,2,4,3]))
print(Solution.minSubArrayLen(4, [1,4,4]))
print(Solution.minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
print(Solution.minSubArrayLen(213, [12,28,83,4,25,26,25,2,25,25,25,12]))

var array = [1,2,3,4,5,6,7]
Solution.rotate(&array, 3)
print(array)

var array2 = [-1,-100,3,99] // [3, 99, -1, 100]
Solution.rotate(&array2, 2)
print(array2)
