class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return nums }
        let pivot = nums.count/2
        
        let left = sortArray(Array(nums[0..<pivot]))
        let right = sortArray(Array(nums[pivot..<nums.count]))
        
        var i = 0, j = 0
        
        var sorted = [Int]()
        while i < left.count || j < right.count {
            if i == left.count {
                sorted.append(right[j])
                j += 1
            } else if j == right.count {
                sorted.append(left[i])
                i += 1
                continue
            } else if left[i] <= right[j] {
                sorted.append(left[i])
                i += 1
            } else {
                sorted.append(right[j])
                j += 1
            }
        }
        
        return sorted
    }
}

print(Solution().sortArray([5,2,3,1])) // [1,2,3,5]
print(Solution().sortArray([0,0,1,1,2,5])) // [0,0,1,1,2,5]
