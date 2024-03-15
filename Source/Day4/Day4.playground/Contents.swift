class Solution {
    static func replaceElements(_ arr: [Int]) -> [Int] {
        if arr.count == 1 { return [-1] }
        var arr = arr
        var lastMax = arr[arr.count - 1]
        
        arr[arr.count - 1] = -1
        for index in stride(from: arr.count - 2, through: 0, by: -1) {
            let current = arr[index]
            arr[index] = max(lastMax, arr[index + 1])
            lastMax = max(current, lastMax)
        }
        return arr
    }
    
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 1 { return 1 }
        var writePointer = 1
        
        for readPointer in 1..<nums.count {
            if nums[readPointer] != nums[readPointer - 1] {
                nums[writePointer] = nums[readPointer]
                writePointer += 1
            }
        }
        
        return writePointer
    }
    
    static func moveZeroes(_ nums: inout [Int]) {
        var writePointer = 0
        var readPointer = 0
        
        while readPointer < nums.count {
            if nums[readPointer] != 0 {
                nums.swapAt(writePointer, readPointer)
                writePointer += 1
                readPointer += 1
            } else {
                readPointer += 1
            }
        }
    }
    
    // same direction
    static func sortArrayByParity(_ nums: [Int]) -> [Int] {
        if nums.count == 1 { return nums }
        var nums = nums
        var readPointer = 0
        var writePointer = 0
        while readPointer < nums.count {
            if nums[readPointer] % 2 == 0 {
                nums.swapAt(writePointer, readPointer)
                writePointer += 1
                readPointer += 1
            } else {
                readPointer += 1
            }
        }
        return nums
    }
    
    // opposite direction
    static func sortArrayByParity2(_ nums: [Int]) -> [Int] {
        if nums.count == 1 { return nums }
        var nums = nums
        var left = 0
        var right = nums.count - 1
        while left < right {
            if nums[left] % 2 == 1 {
                if nums[right] % 2 == 0  {
                    nums.swapAt(left, right)
                    left += 1
                }
                right -= 1
                continue
            } else {
                left += 1
            }
        }
        return nums
    }
}

print(Solution.replaceElements([17,18,5,4,6,1]))
print(Solution.replaceElements([57010,40840,69871,14425,70605]))

var array3 = [0,0,1,1,1,2,2,3,3,4]
print(Solution.removeDuplicates(&array3))
print(array3)

var array4 = [0,0,1,1,1,2,2,3,3,4]
print(Solution.removeDuplicates(&array4))
print(array4)

var array5 = [0,1,0,3,12]
print(Solution.moveZeroes(&array5))
print(array5)

var array6 = [0]
print(Solution.moveZeroes(&array6))
print(array6)

var array7 = [1, 0]
print(Solution.moveZeroes(&array7))
print(array7)

print(Solution.sortArrayByParity([3,1,2,4]))
print(Solution.sortArrayByParity([0]))


print(Solution.sortArrayByParity2([3,1,2,4]))
print(Solution.sortArrayByParity2([0]))

