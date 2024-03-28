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
}

print(Solution().numJewelsInStones("aA", "aAAbbbb")) // 3
print(Solution().numJewelsInStones("z", "ZZ")) //0
print(Solution().lengthOfLongestSubstring("abcabcbb")) //3
print(Solution().lengthOfLongestSubstring("bbbbb")) // 1
print(Solution().lengthOfLongestSubstring("pwwkew")) // 3
