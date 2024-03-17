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
    
    static func dominantIndex(_ nums: [Int]) -> Int {
        let max = nums.enumerated().max { a, b in
            a.element < b.element
        }
        
        for (index, num) in nums.enumerated() {
            if index == max!.offset { continue }
            if num * 2 > max!.element {
                return -1
            }
        }
        
        return max!.offset
    }
    
    static func plusOne(_ digits: [Int]) -> [Int] {
        var carry = 1
        var digits = digits
        
        for index in stride(from: digits.count - 1, through: 0, by: -1) {
            let runningSum = digits[index] + carry
            digits[index] = runningSum % 10
            carry = runningSum / 10
            if carry == 0 {
                break
            }
        }
        
        if carry == 1 {
            digits.insert(1, at: 0)
        }
        
        return digits
    }
}

print(Solution.pivotIndex([1,7,3,6,5,6]))
print(Solution.pivotIndex([1,2,3]))
print(Solution.pivotIndex([2,1,-1]))
print(Solution.pivotIndex([0]))
print(Solution.dominantIndex([3,6,1,0]))
print(Solution.dominantIndex([1,2,3,4]))
print(Solution.plusOne([9]))
print(Solution.plusOne([4,3,2,1]))
print(Solution.plusOne([1,2,3]))
