class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let match = map[num] {
                return [index, match]
            }
            
            map[target - num] = index
        }
        
        return []
    }
}

print(Solution().twoSum([2, 7, 11, 15], 9))
print(Solution().twoSum([6, 5, 7, 8, 9, 3], 10))
print(Solution().twoSum([2, 4, 11, 3], 6))
