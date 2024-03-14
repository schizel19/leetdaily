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
}


var array = [0,1,2,2,3,0,4,2]
Solution.removeElement(&array, 2)
print(array)
print(array.count)

var array2 = [0,1,2,2,3,0,4,2]
Solution.removeElement2(&array2, 2)
print(array2)
print(array2.count)
