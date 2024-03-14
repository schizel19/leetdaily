import Foundation

class Solution {
    // simple
    static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll(where: { $0 == val })
        return nums.count
    }
    
    //pointers
    static func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        var count = 0
        for index in 0..<nums.count {
            if nums[index] != val {
                nums.swapAt(index, count)
                count += 1
            }
        }
        return count
    }
    
    // simple
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = NSOrderedSet(array: nums).array as! [Int]
        return nums.count
    }
    
    // pointers
    static func removeDuplicates2(_ nums: inout [Int]) -> Int {
        var count = 0
        var unique = Int.min
        for index in 0..<nums.count {
            if unique != nums[index] {
                unique = nums[index]
                nums.swapAt(index, count)
                count += 1
            }
        }
        return count
    }
    
    static func checkIfExist(_ arr: [Int]) -> Bool {
        var dic = [Int: Int]()
        for num in arr {
            if let _ = dic[num * 2] {
                return true
            } else if num % 2 == 0, let _ = dic[num/2] {
                return true
            } else {
                dic[num] = 1
            }
        }
        return false
    }
    
    // one way
    static func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count < 3 { return false }
        if arr[0] > arr[1] { return false }
        var isMovingUp = true
        
        var index = 0
        
        while index < arr.count - 1 && isMovingUp {
            if arr[index] == arr[index + 1] { return false }
            if arr[index] > arr[index + 1] {
                isMovingUp = false
            }
            index += 1
        }
        
        while index < arr.count - 1 && !isMovingUp {
            if arr[index] == arr[index + 1] { return false }
            if arr[index] < arr[index + 1] {
                return false
            }
            index += 1
        }
        
        return !isMovingUp
    }
    
    // two pointer
    static func validMountainArray2(_ arr: [Int]) -> Bool {
        var left = 0, right = arr.count - 1
        while left + 1 < arr.count, arr[left] < arr[left + 1] {
            left += 1
        }
        while right > 0, arr[right - 1] > arr[right] {
            right -= 1
        }
        return left > 0 && left == right && right < arr.count - 1
    }
    
}


var array = [0,1,2,2,3,0,4,2]
Solution.removeElement(&array, 2)
print(array)
print(array.count)

var array2 = [0,1,2,2,3,0,4,2]
Solution.removeElement2(&array2, 2)
print(array2)
print(array2.count)

var array3 = [0,0,1,1,1,2,2,3,3,4]
print(Solution.removeDuplicates(&array3))
print(array3)

var array4 = [0,0,1,1,1,2,2,3,3,4]
print(Solution.removeDuplicates2(&array4))
print(array4)

print(Solution.checkIfExist([10,2,5,3]))
print(Solution.checkIfExist([3,1,7,11]))
print(Solution.checkIfExist([4,-7,11,4,18]))

print(Solution.validMountainArray([2, 1]))
print(Solution.validMountainArray([3, 5, 5]))
print(Solution.validMountainArray([0, 3, 2, 1]))
print(Solution.validMountainArray([6, 6, 3, 3]))
print(Solution.validMountainArray([0,1,2,4,2,1]))
print(Solution.validMountainArray([2,1,2,3,5,7,9,10,12,14,15,16,18,14,13]))
print(Solution.validMountainArray([9,8,7,6,5,4,3,2,1,0]))

print(Solution.validMountainArray2([2, 1]))
print(Solution.validMountainArray2([3, 5, 5]))
print(Solution.validMountainArray2([0, 3, 2, 1]))
print(Solution.validMountainArray2([6, 6, 3, 3]))
print(Solution.validMountainArray2([0,1,2,4,2,1]))
print(Solution.validMountainArray2([2,1,2,3,5,7,9,10,12,14,15,16,18,14,13]))
print(Solution.validMountainArray2([9,8,7,6,5,4,3,2,1,0]))

