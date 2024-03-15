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
}

print(Solution.replaceElements([17,18,5,4,6,1]))
print(Solution.replaceElements([57010,40840,69871,14425,70605]))

var array3 = [0,0,1,1,1,2,2,3,3,4]
print(Solution.removeDuplicates(&array3))
print(array3)

var array4 = [0,0,1,1,1,2,2,3,3,4]
print(Solution.removeDuplicates(&array4))
print(array4)
