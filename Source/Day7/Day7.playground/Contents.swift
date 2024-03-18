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
}


print(Solution.addBinary("11", "1"))
print(Solution.addBinary("1010", "1011"))
print(Solution.addBinary("1", "111"))
