class MinStack {
    
    private var values = [(val: Int, min: Int)]()
    
    init() {}
    
    func push(_ val: Int) {
        let m = min(val, values.last?.min ?? .max)
        values.append((val: val, min: m))
    }
    
    func pop() {
        if !values.isEmpty {
            values.removeLast()
        }
    }
    
    func top() -> Int {
        return values.last?.val ?? .min
    }
    
    func getMin() -> Int {
        return values.last?.min ?? .min
    }
}

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
print(obj.getMin()) // -3
obj.pop()
print(obj.top()) // 0
print(obj.getMin()) // -2

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count <= 1 { return false }
        let match: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        
        var charStack = [Character]()
        
        for char in s {
            if let ending = match[char] {
                guard !charStack.isEmpty, ending == charStack.removeLast() else { return false }
                continue
            }
            charStack.append(char)
        }
        
        return charStack.isEmpty
    }
}

print(Solution().isValid("()")) // true
print(Solution().isValid("()[]{}")) // true
print(Solution().isValid("false")) // false
print(Solution().isValid("(({{}[[{}]]}))")) // true
