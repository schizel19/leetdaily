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
    
    // backwards
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var indexStack = [Int]()
        var results = [Int](repeating: 0, count: temperatures.count)
        
        for i in stride(from: temperatures.count - 1, through: 0, by: -1) {
            while !indexStack.isEmpty, temperatures[indexStack.last!] <= temperatures[i] {
                indexStack.removeLast()
            }
            
            if !indexStack.isEmpty {
                results[i] = indexStack.last! - i
            }
            
            indexStack.append(i)
        }
        
        return results
    }
    
    // forwards
    func dailyTemperatures2(_ temperatures: [Int]) -> [Int] {
        var indexStack = [Int]()
        var results = [Int](repeating: 0, count: temperatures.count)
        
        for (index, temp) in temperatures.enumerated() {
            while !indexStack.isEmpty, temp > temperatures[indexStack.last!] {
                let last = indexStack.removeLast()
                results[last] = index - last
            }
            indexStack.append(index)
        }
        
        return results
    }
    
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for c in tokens {
            switch c {
            case "+":
                stack.append(stack.removeLast() + stack.removeLast())
            case "-":
                let val1 = stack.removeLast()
                let val2 = stack.removeLast()
                stack.append(val2 - val1)
            case "/":
                let val1 = stack.removeLast()
                let val2 = stack.removeLast()
                stack.append(val2 / val1)
            case "*":
                stack.append(stack.removeLast() * stack.removeLast())
            default:
                stack.append(Int(c)!)
            }
        }
        
        return stack.first!
    }
}

print(Solution().isValid("()")) // true
print(Solution().isValid("()[]{}")) // true
print(Solution().isValid("false")) // false
print(Solution().isValid("(({{}[[{}]]}))")) // true
print(Solution().dailyTemperatures([73,74,75,71,69,72,76,73])) // [1,1,4,2,1,1,0,0]
print(Solution().dailyTemperatures([30,40,50,60])) // [1,1,1,0]
print(Solution().dailyTemperatures([30,60,90])) // [1,1,0]
print(Solution().dailyTemperatures2([73,74,75,71,69,72,76,73])) // [1,1,4,2,1,1,0,0]
print(Solution().dailyTemperatures2([30,40,50,60])) // [1,1,1,0]
print(Solution().dailyTemperatures2([30,60,90])) // [1,1,0]
print(Solution().evalRPN(["2","1","+","3","*"])) // ((2 + 1) * 3) = 9
print(Solution().evalRPN(["4","13","5","/","+"])) // (4 + (13 / 5)) = 6
print(Solution().evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))
// ((10 * (6 / ((9 + 3) * -11))) + 17) + 5 = 22
