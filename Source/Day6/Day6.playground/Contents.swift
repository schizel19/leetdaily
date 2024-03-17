class Solution {
    
    // sol 1
    static func pivotIndex(_ nums: [Int]) -> Int {
        var sumOfLeft = [0]
        var sumOfRight = [0]
        
        for index in 1..<nums.count {
            sumOfLeft.append(sumOfLeft[index - 1] + nums[index - 1])
            sumOfRight.insert(sumOfRight[0] + nums[nums.count - index], at: 0)
        }
        
        var foundIndex = -1
        
        for (index, value) in sumOfLeft.enumerated() {
            if sumOfRight[index] == value {
                foundIndex = index
                break
            }
        }
        
        return foundIndex
    }
    
    // sol 2
    static func pivotIndex2(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.reduce(0, +)
        
        for (index, num) in nums.enumerated() {
            right -= num
            if left == right {
                return index
            }
            left += num
        }
        
        return -1
    }
}

print(Solution.pivotIndex([1,7,3,6,5,6]))
print(Solution.pivotIndex([1,2,3]))
print(Solution.pivotIndex([2,1,-1]))
print(Solution.pivotIndex([0]))
