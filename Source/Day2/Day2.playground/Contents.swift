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
    
    // simple
    static func duplicateZeros(_ arr: inout [Int]) {
        var i = 0
        while i < arr.count {
            if arr[i] == 0 {
                arr.insert(0, at: i)
                arr.removeLast()
                i += 2
            }
            else {
                i += 1
            }
        }
    }
    
    // ideal
    static func duplicateZeros2(_ arr: inout [Int]) {
        var possibleDups = 0;
        var length = arr.count - 1;

        // Find the number of zeros to be duplicated
        // Stopping when left points beyond the last element in the original array
        // which would be part of the modified array
        for left in 0...length - possibleDups {
            // count the zeros
            if arr[left] == 0 {
                // Edge case: This zero can't be duplicated. We have no more space,
                // as left is pointing to the last element which could be included
                if left == length - possibleDups {
                    arr[length] = 0
                    length -= 1
                    break
                }
                possibleDups += 1
            }
        }
        
        // Start backwards from the last element which would be part of new array.
        for i in stride(from: length - possibleDups, to: 0, by: -1) {
            if arr[i] == 0 {
                arr[i + possibleDups] = 0
                possibleDups -= 1
                arr[i + possibleDups] = 0
            } else {
                arr[i + possibleDups] = arr[i]
            }
        }
    }
}

print(Solution.findMaxConsecutiveOnes([1,1,0,1,1,1]))
print(Solution.findNumbers([555,901,482,1771]))
print(Solution.sortedSquares([-7,-3,2,3,11]))
print(Solution.sortedSquares2([-7,-3,2,3,11]))

var array = [1,0,2,3,0,4,5,0]
Solution.duplicateZeros(&array)
print(array)

var array2 = [1,0,2,3,0,4,5,0]
Solution.duplicateZeros2(&array2)
print(array2)
