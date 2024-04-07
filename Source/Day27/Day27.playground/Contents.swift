public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
      self.val = val
      self.left = left
      self.right = right
  }
}

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var nodes = [p, q]
        
        while !nodes.isEmpty {
            let (p, q) = (nodes.removeFirst(), nodes.removeFirst())
            if p == nil, q == nil { continue }
            if p == nil || q == nil { return false }
            if p!.val != q!.val { return false }
            nodes.append(p?.left)
            nodes.append(q?.left)
            nodes.append(p?.right)
            nodes.append(q?.right)
        }
        
        return true
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 { return [] }
        var result = [String]()
        var stack = [(String, Int, Int)]()
        
        stack.append(("", 0, 0))
        
        while !stack.isEmpty {
            let (current, open, close) = stack.removeLast()
            if current.count == n * 2 {
                result.append(current)
            } else {
                if open < n {
                    stack.append((current + "(", open + 1, close))
                }
                if close < open {
                    stack.append((current + ")", open, close + 1))
                }
            }
        }
        
        return result
    }
    
    // iterative
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [(Int, Int)]() // index, height
        var maxArea = 0
        
        for (i, h) in heights.enumerated() {
            var start = i
            while !stack.isEmpty, stack.last!.1 > h {
                let (index, height) = stack.removeLast()
                maxArea = max(maxArea, height * (i - index))
                start = index
            }
            stack.append((start, h))
        }
        
        for (i, h) in stack {
            maxArea = max(maxArea, h * (heights.count - i))
        }
        
        return maxArea
    }
    
    // recursive
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        if heights.isEmpty { return 0 }
        var memo = [String: Int]()
        func calculateMaxArea(_ start: Int, _ end: Int) -> Int {
            if start > end { return 0 }
            if let cached = memo["\(start),\(end)"] {
                return cached
            }
            
            var minIndex = start
            for i in start...end {
                if heights[i] < heights[minIndex] {
                    minIndex = i
                }
            }
            
            let area1 = heights[minIndex] * (end - start + 1)
            let area2 = calculateMaxArea(start, minIndex - 1)
            let area3 = calculateMaxArea(minIndex + 1, end)
            memo["\(start),\(end)"] = max(area1, area2, area3)
            return max(area1, area2, area3)
        }
        
        return calculateMaxArea(0, heights.count - 1)
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var stack = [([Int], [Int])]() //prefix, candidates
        
        stack.append(([], nums))
        
        while !stack.isEmpty {
            var (pre, candidates) = stack.removeLast()
            
            if pre.count == nums.count {
                result.append(pre)
                continue
            }
            
            for i in 0..<candidates.count {
                var new = candidates
                let num = new.remove(at: i)
                stack.append((pre + [num], new))
            }
        }
        
        return result
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let map: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"],
        ]
        
        var result = [String]()
        var stack = [(String, String)]()
        
        stack.append(("", digits))
        
        while !stack.isEmpty {
            var (curr, str) = stack.removeLast()
            if curr.count == digits.count {
                result.append(curr)
                continue
            }
            let char = str.removeFirst()
            for c in map[char] ?? [] {
                stack.append((curr + c, str))
            }
        }
        
        return result
    }
}

let node3 = TreeNode(3)
let node2 = TreeNode(2)
let node1 = TreeNode(1, node2, node3)

let nodeC = TreeNode(3)
let nodeB = TreeNode(2)
let nodeA = TreeNode(1, nodeB, nodeC)

let nodeT3 = TreeNode(1)
let nodeT2 = TreeNode(2)
let nodeT1 = TreeNode(1, nodeT2, nodeT3)

print(Solution().isSameTree(node1, nodeA)) // true
print(Solution().isSameTree(node1, nodeT1)) // false
print(Solution().generateParenthesis(3)) // ["((()))","(()())","(())()","()(())","()()()"]
print(Solution().generateParenthesis(1)) // ["()"]

print(Solution().largestRectangleArea([2, 4])) // 4
print(Solution().largestRectangleArea([2,1,5,6,2,3])) // 10
print(Solution().largestRectangleArea2([2, 4])) // 4
print(Solution().largestRectangleArea2([2,1,5,6,2,3])) // 10

print(Solution().permute([1, 2, 3])) // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

print(Solution().letterCombinations("23")) //["ad","ae","af","bd","be","bf","cd","ce","cf"]
