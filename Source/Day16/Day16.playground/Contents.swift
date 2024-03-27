class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.count == 1 { return [strs] }
        var anagrams = [String: [String]]()
        
        for str in strs {
            anagrams["\(str.sorted())"] = anagrams["\(str.sorted())", default: []] + [str]
        }
        
        return anagrams.map { $0.value }
    }
}

print(Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"])) //[["bat"],["nat","tan"],["ate","eat","tea"]]
print(Solution().groupAnagrams([""])) //[[""]]
print(Solution().groupAnagrams(["a"])) // [["a"]]
