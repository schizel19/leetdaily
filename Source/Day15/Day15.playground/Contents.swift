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
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var map = [Character: Character]()
        var set = Set<Character>()
        var accumulated = ""
        
        for index in s.indices {
            if let newC = map[s[index]] {
                accumulated += "\(newC)"
                continue
            }
            
            if set.contains(t[index]) {
                return false
            }
            
            accumulated += "\(t[index])"
            map[s[index]] = t[index]
            set.insert(t[index])
        }
        
        return t == accumulated
    }
    
}

print(Solution().twoSum([2, 7, 11, 15], 9)) // [0, 1]
print(Solution().twoSum([6, 5, 7, 8, 9, 3], 10)) // [2, 5]
print(Solution().twoSum([2, 4, 11, 3], 6)) // [0, 1]

print(Solution().isIsomorphic("egg", "add")) // true
print(Solution().isIsomorphic("foo", "bar")) // false
print(Solution().isIsomorphic("paper", "title")) // true
print(Solution().isIsomorphic("badc", "baba")) // true
