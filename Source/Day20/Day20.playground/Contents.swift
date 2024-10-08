class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty { return 0 }
        var visited = Set<String>()
        var islands = 0
        var grid = grid
        
        func dfs(_ row: Int, _ column: Int) {
            guard row >= 0,
                  column >= 0,
                  row < grid.count,
                  column < grid[0].count,
                  grid[row][column] == "1" else { return }
            grid[row][column] = "#"
            dfs(row + 1, column)
            dfs(row - 1, column)
            dfs(row, column + 1)
            dfs(row, column - 1)
        }
        
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                if grid[row][column] == "1"
                {
                    dfs(row, column)
                    islands += 1
                }
            }
        }
        
        return islands
    }
}

let grid1: [[Character]]  = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
]

let grid2: [[Character]] = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
]

print(Solution().numIslands(grid1)) // 1
print(Solution().numIslands(grid2)) // 2

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

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

class Solution2 {
    func cloneGraph(_ node: Node?) -> Node? {
        var map = [Int: Node?]()
        
        func dfs(_ node: Node?) -> Node? {
            guard let node else { return nil }
            if let n = map[node.val] {
                return n
            }
            let n = Node(node.val)
            map[node.val] = n
            for neighbor in node.neighbors {
                n.neighbors.append(dfs(neighbor))
            }
            return n
        }
        
        return dfs(node)
    }
    
    // simple
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        func dfs(from index: Int, running: Int = 0) -> Int {
            if index == nums.count {
                return running == target ? 1 : 0
            }
            return dfs(from: index + 1, running: running + nums[index]) + dfs(from: index + 1, running: running - nums[index])
        }
        return dfs(from: 0)
    }
    
    // with memoize
    func findTargetSumWays2(_ nums: [Int], _ target: Int) -> Int {
        var map = [String: Int]()
        func dfs(from index: Int, running: Int = 0) -> Int {
            if let count = map[("\(index)->\(running)")] {
                return count
            }
            
            if index == nums.count {
                return running == target ? 1 : 0
            }
            
            let positive = dfs(from: index + 1, running: running + nums[index])
            let negative = dfs(from: index + 1, running: running - nums[index])
            
            map[("\(index)->\(running)")] = positive + negative
            
            return positive + negative
        }
        return dfs(from: 0)    
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var nodes = [TreeNode?]()
        var curr = root
        
        while !nodes.isEmpty || curr != nil {
            while curr != nil {
                nodes.append(curr)
                curr = curr?.left
            }
            curr = nodes.removeLast()
            result.append(curr!.val)
            curr = curr?.right
        }
        
        return result
    }
}

let node1 = Node(1)
let node2 = Node(2)
let node3 = Node(3)
let node4 = Node(4)

node1.neighbors = [node2, node4]
node2.neighbors = [node1, node3]
node3.neighbors = [node2, node4]
node4.neighbors = [node1, node3]

print(Solution2().cloneGraph(node1) === node1) // false
print(Solution2().cloneGraph(node1)!.val) // 1

print(Solution2().findTargetSumWays([1,1,1,1,1], 3)) // 5
/*
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 */

print(Solution2().findTargetSumWays([1], 1)) // 1

print(Solution2().findTargetSumWays2([1,1,1,1,1], 3)) // 5
print(Solution2().findTargetSumWays2([1], 1)) // 1

let nodeA = TreeNode(1)
let nodeB = TreeNode(2)
let nodeC = TreeNode(3)

nodeA.right = nodeB
nodeB.left = nodeC

print(Solution2().inorderTraversal(nodeA)) // [1,3,2]
print(Solution2().inorderTraversal(nil)) // []
