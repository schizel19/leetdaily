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
