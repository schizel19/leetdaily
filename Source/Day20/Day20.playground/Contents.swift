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
