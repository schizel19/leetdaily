
class MyQueue {

    private var stack1 = [Int]()
    private var stack2 = [Int]()
    private var front: Int!
    init() {
        
    }
    
    func push(_ x: Int) {
        if stack1.isEmpty { front = x }
        stack1.append(x)
    }
    
    func pop() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            }
        }
        return stack2.removeLast()
    }
    
    func peek() -> Int {
        stack2.isEmpty ? front : stack2.last!
    }
    
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}

let obj = MyQueue()
obj.push(3)
obj.push(5)
print(obj.peek()) // 3
print(obj.pop()) // 3
print(obj.empty()) // false
print(obj.pop()) // 5
print(obj.empty()) // true
