
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

class MyStack {
    
    private var queue = [Int]()

    init() { }
    
    func push(_ x: Int) {
        queue.append(x)
        for _ in 0..<queue.count - 1 {
            queue.append(queue.removeFirst())
        }
    }
    
    func pop() -> Int {
        queue.removeFirst()
    }
    
    func top() -> Int {
        queue.first!
    }
    
    func empty() -> Bool {
        queue.isEmpty
    }
}

let stack = MyStack()
stack.push(3)
stack.push(5)
print(stack.top()) // 5
print(stack.pop()) // 5
print(stack.empty()) // false
print(stack.pop()) // 3
print(stack.empty()) // true

class Solution {
    
    func decodeString(_ s: String) -> String {
        var stack = [(String, Int)]()
        
        var currNum = 0
        var currStr = ""
        
        for char in s {
            if char == "[" {
                stack.append((currStr, currNum))
                currStr = ""
                currNum = 0
            } else if char == "]" {
                let (lastString, count) = stack.removeLast()
                let str = (0..<count).reduce("", { sub, _ in sub + currStr })
                currStr = lastString + str
            } else if let i = Int("\(char)") {
                currNum = currNum * 10 + i
            } else {
                currStr += "\(char)"
            }
        }
        
        return currStr
    }
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var visited = Set<String>()
        var image = image
        var ref = image[sr][sc]
        func flood(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ color: Int) {
            guard sr >= 0, sr < image.count, sc >= 0, sc < image[sr].count, !visited.contains("\(sr),\(sc)"),
                  image[sr][sc] == ref else { return }
            image[sr][sc] = color
            visited.insert("\(sr),\(sc)")
            flood(&image, sr - 1, sc, color)
            flood(&image, sr + 1, sc, color)
            flood(&image, sr, sc - 1, color)
            flood(&image, sr, sc + 1, color)
        }
        
        flood(&image, sr, sc, color)
        return image
    }
}

print(Solution().decodeString("3[a]2[bc]") == "aaabcbc") // aaabcbc
print(Solution().decodeString("3[a2[c]]") == "accaccacc") // accaccacc
print(Solution().decodeString("2[abc]3[cd]ef") == "abcabccdcdcdef") // abcabccdcdcdef

print(Solution().floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)) // return [[2,2,2],[2,2,0],[2,0,1]]
