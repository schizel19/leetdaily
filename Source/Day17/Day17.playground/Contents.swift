class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jewels = Set<Character>(jewels)
        return stones.reduce(0) { jewels.contains($1) ? $0 + 1 : $0 }
    }
    
    // using set
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var seen = Set<Character>()
        var s = Array(s)
        var left = 0
        var longest = Int.min
        for (right, char) in s.enumerated() {
            while seen.contains(char) {
                seen.remove(s[left])
                left += 1
            }
            seen.insert(char)
            longest = max(longest, right - left + 1)
        }
        
        return longest
    }
    
    // using hash map
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var charIndex = [Character: Int]()
        var left = 0
        var result = 0
        
        for (right, char) in s.enumerated() {
            if let index = charIndex[char] {
                left = max(index, left)
            }
            
            result = max(result, right - left + 1)
            charIndex[char] = right + 1
        }
        
        return result
    }
    
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var sums = [Int: Int]()
        for i in nums1 {
            for j in nums2 {
                sums[i + j] = sums[i + j, default: 0] + 1
            }
        }
        
        var count = 0
        for k in nums3 {
            for l in nums4 {
                count += sums[-(k + l), default: 0]
            }
        }
        
        return count
    }
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequency = [Int: Int]()
        for num in nums {
            frequency[num] = frequency[num, default: 0] + 1
        }
        
        var buckets = [[Int]](repeating: [], count: nums.count + 1)
        for (key, value) in frequency {
            buckets[value] = buckets[value] + [key]
        }
        
        var result = [Int]()
        var k = k
        
        for i in stride(from: buckets.count - 1, through: 0, by: -1) {
            if buckets[i].isEmpty { continue }
            result.append(contentsOf: buckets[i])
            k -= buckets[i].count
            if k == 0 { break }
        }
        
        return result
    }
}

class RandomizedSet {
    var indeces = [Int: Int]()
    var elements = [Int]()
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if let _ = indeces[val] { return false }
        indeces[val] = elements.count
        elements.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = indeces.removeValue(forKey: val) else { return false }
        
        if index == elements.count - 1 {
            elements.removeLast()
        } else {
            elements[index] = elements.removeLast()
            indeces[elements[index]] = index
        }
        return true
    }
    
    func getRandom() -> Int {
        return elements.randomElement()!
    }
}

print(Solution().numJewelsInStones("aA", "aAAbbbb")) // 3
print(Solution().numJewelsInStones("z", "ZZ")) //0
print(Solution().lengthOfLongestSubstring("abcabcbb")) //3
print(Solution().lengthOfLongestSubstring("bbbbb")) // 1
print(Solution().lengthOfLongestSubstring("pwwkew")) // 3
print(Solution().fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2])) // 2
print(Solution().fourSumCount([0], [0], [0], [0])) // 1
print(Solution().fourSumCount([-1, -1], [-1, 1], [-1, 1], [1, -1])) // 6
print(Solution().topKFrequent([1,1,1,2,2,3], 2)) // [1, 2]
print(Solution().topKFrequent([1], 1)) // [1]
print(Solution().topKFrequent([1, 2], 2)) // [1, 2]
print(Solution().topKFrequent([1, -1], 1)) // [-1]
print(Solution().topKFrequent([-1, -1], 1)) // [-1]

let obj = RandomizedSet()
print(obj.remove(0)) // false
print(obj.remove(0)) // false
print(obj.insert(0)) // true
print(obj.getRandom()) // 0
print(obj.remove(0)) // true
print(obj.insert(0)) // true
