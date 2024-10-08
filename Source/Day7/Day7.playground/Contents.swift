class Solution {
    
    // without casting to Int
    static func addBinary(_ a: String, _ b: String) -> String {
        var result = ""
        var carry = 0
        var a = a
        var b = b
        var i = a.count - 1
        var j = b.count - 1
        
        while i >= 0 || j >= 0 {
            let valA = i < 0 ? "0": a.popLast()!
            let valB = j < 0 ? "0" : b.popLast()!
            
            switch (valA, valB) {
            case ("1", "1") where carry == 1:
                result.insert("1", at: result.startIndex)
                carry = 1
            case ("1", "1") where carry == 0,
                ("1", "0") where carry == 1,
                ("0", "1") where carry == 1 :
                result.insert("0", at: result.startIndex)
                carry = 1
            case ("0", "0") where carry == 1:
                result.insert("1", at: result.startIndex)
                carry = 0
            case ("0", "0"):
                result.insert("0", at: result.startIndex)
            case ("1", "0"), ("0", "1"):
                result.insert("1", at: result.startIndex)
            default:
                continue
            }
            i -= 1
            j -= 1
        }
        
        if carry == 1 {
            result.insert("1", at: result.startIndex)
        }
        
        return result
    }
    
    // no conversion
    static func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count > haystack.count { return -1 }
        var needleIndex = 0
        let hayStart = haystack.startIndex
        let needleStart = needle.startIndex
        
        for foundIndex in 0..<(haystack.count - needle.count) {
            for i in 0..<needle.count {
                let valA = haystack[haystack.index(hayStart, offsetBy: foundIndex + i)]
                let valB = needle[needle.index(needleStart, offsetBy: i)]
                
                if valA != valB {
                    break
                }
                
                if i == needle.count - 1 {
                    return foundIndex
                }
            }
        }
        
        return -1
    }
    
    // without using string operations
    static func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 1 { return strs.first! }
        var prefix = ""
        var moveToNext = true
        var index = 0
        
        while moveToNext {
            let ref = strs[0]
            if index >= ref.count { break }
            
            let str1 = ref[ref.index(ref.startIndex, offsetBy: index)]
            
            var isSimilar = true
            for j in 1..<strs.count where isSimilar {
                if index >= strs[j].count {
                    isSimilar = false
                    
                } else {
                    let ref2 = strs[j]
                    let str2 = ref2[ref2.index(ref2.startIndex, offsetBy: index)]
                    isSimilar = str1 == str2
                }
            }
            
            if isSimilar {
                prefix.append(str1)
                index += 1
            } else {
                moveToNext = false
            }
        }
        
        return prefix
    }
    
    static func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
    // with sort
    static func arrayPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        return stride(from: 0, to: nums.count - 1, by: 2).reduce(0) { $0 + nums[$1] }
    }
    
    static func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count == 2 { return [1, 2] }
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []
    }
}

print(Solution.addBinary("11", "1"))
print(Solution.addBinary("1010", "1011"))
print(Solution.addBinary("1", "111"))
print(Solution.strStr("sadbutsad", "sad"))
print(Solution.strStr("leetcode", "leeto"))
print(Solution.strStr("mississippi", "ssip"))
print(Solution.longestCommonPrefix(["flower","flow","flight"]))
print(Solution.longestCommonPrefix(["dog","racecar","car"]))
print(Solution.longestCommonPrefix(["ab","a"]))

var string: [Character] = ["h","e","l","l","o"]
Solution.reverseString(&string)
print(string)
var string2: [Character] = ["H","a","n","n","a","h"]
Solution.reverseString(&string2)
print(string2)

print(Solution.arrayPairSum([1,4,3,2]))
print(Solution.arrayPairSum([6,2,6,5,1,2]))

print(Solution.twoSum([2,7,11,15], 9))
print(Solution.twoSum([2,3,4], 6))
print(Solution.twoSum([-1, 0], -1))
print(Solution.twoSum([-2, -1, 1], -1))
print(Solution.twoSum([-3,3,4,90], 0))
