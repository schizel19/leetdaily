import Foundation
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
    
    static func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        var res = [Int](repeating: 1, count: rowIndex + 1)
        for i in 1...rowIndex {
            res[i] = res[i-1] * (rowIndex-i + 1)/i
        }
        return res
    }
    
    // simple swift
    static func reverseWords(_ s: String) -> String {
        return s.split(separator: " ", omittingEmptySubsequences: true).reversed().joined(separator: " ")
    }
    
    // algo
    static func reverseWords2(_ s: String) -> String {
        var array = Array(s)
                        
        var lastWasSpace = true
        
        var currentIndex = 0
        
        for char in array {
            if char == " " {
                if lastWasSpace {
                    array.remove(at: currentIndex)
                    currentIndex -= 1
                }
                lastWasSpace = true
            } else {
                lastWasSpace = false
            }
            currentIndex += 1
        }
        
        if lastWasSpace {
            array.remove(at: currentIndex - 1)
        }
        
        var left = 0
        var right = array.count - 1
        while left < right {
            array.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        left = 0
        right = 0
        
        while left < array.count {
            while right < array.count, array[right] != " " {
                right += 1
            }
            
            var pseudoRight = right - 1

            while left < pseudoRight {
                array.swapAt(left, pseudoRight)
                left += 1
                pseudoRight -= 1
            }
            
            right += 1
            left = right
        }
        
        return String(array)
    }
}

//print(Solution.minSubArrayLen(7, [2,3,1,2,4,3]))
//print(Solution.minSubArrayLen(4, [1,4,4]))
//print(Solution.minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
//print(Solution.minSubArrayLen(213, [12,28,83,4,25,26,25,2,25,25,25,12]))
//
//var array = [1,2,3,4,5,6,7]
//Solution.rotate(&array, 3)
//print(array)
//
//var array2 = [-1,-100,3,99]
//Solution.rotate(&array2, 2)
//print(array2)
//
//print(Solution.getRow(0))
//print(Solution.getRow(3))
//print(Solution.getRow(1))
//
//print(Solution.reverseWords("the sky is blue"))
//print(Solution.reverseWords("  hello world  "))
//print(Solution.reverseWords("a good   example"))

print(Solution.reverseWords2("the sky is blue"))
print(Solution.reverseWords2("  hello world  "))
print(Solution.reverseWords2("a good   example"))
