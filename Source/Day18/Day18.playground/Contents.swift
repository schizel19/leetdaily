class MyCircularQueue {
    var head = 0
    var tail = -1
    var values: [Int]
    
    init(_ k: Int) {
        values = [Int](repeating: -1, count: k)
    }
    
    func enQueue(_ value: Int) -> Bool {
        let nextTail = (tail + 1) % values.count
        if nextTail == head, values[head] != -1 { return false }
        tail = nextTail
        values[tail] = value
        return true
    }
    
    func deQueue() -> Bool {
        guard values[head] != -1 else { return false }
        values[head] = -1
        head = (head + 1) % values.count
        return true
    }
    
    func Front() -> Int {
        values[head]
    }
    
    func Rear() -> Int {
        tail != -1 ? values[tail] : tail
    }
    
    func isEmpty() -> Bool {
        values[head] == -1
    }
    
    func isFull() -> Bool {
        return (tail + 1) % values.count == head && values[head] != -1
    }
}

let obj = MyCircularQueue(5)
print(obj.enQueue(8)) // true
print(obj.deQueue()) // true
print(obj.deQueue()) // false
print(obj.enQueue(2)) // true
print(obj.enQueue(3)) // true
print(obj.enQueue(4)) // true
print(obj.enQueue(5)) // true
print(obj.enQueue(6)) // true
print(obj.enQueue(7)) // false
print(obj.Front()) // 2
print(obj.Rear()) // 6
print(obj.isEmpty()) // false
print(obj.isFull()) // true

class Solution {
    
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty { return 0 }
        let rows = grid.count
        let columns = grid[0].count
        var visited = Set<String>()
        var islands = 0
        
        func bfs(_ row: Int, _ column: Int) {
            var queue = [(Int, Int)]()
            visited.insert("\(row),\(column)")
            queue.append((row, column))
            
            while queue.count > 0 {
                let (row, column) = queue.removeFirst()
                let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
                
                for direction in directions {
                    let (newR, newC) = (row + direction.0, column + direction.1)
                    if newR >= 0, newR < rows,
                       newC >= 0, newC < columns,
                       grid[newR][newC] == "1",
                       !visited.contains("\(newR),\(newC)") {
                        queue.append((newR, newC))
                        visited.insert("\(newR),\(newC)")
                    }
                }
            }
        }
        
        for row in 0..<rows {
            for column in 0..<columns {
                if grid[row][column] == "1", !visited.contains("\(row),\(column)") {
                    bfs(row, column)
                    islands += 1
                }
            }
        }
        
        return islands
    }
    
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let nextSlot: [Character: Character] = [
            "0": "1",
            "1": "2",
            "2": "3",
            "3": "4",
            "4": "5",
            "5": "6",
            "6": "7",
            "7": "8",
            "8": "9",
            "9": "0",
        ]
        
        let prevSlot: [Character: Character] = [
            "0": "9",
            "1": "0",
            "2": "1",
            "3": "2",
            "4": "3",
            "5": "4",
            "6": "5",
            "7": "6",
            "8": "7",
            "9": "8",
        ]
        
        var visited = Set<String>(deadends)
        var pending = [String]()
        
        var turns = 0
        
        if visited.contains("0000") { return -1 }
        
        visited.contains("0000")
        pending.append("0000")
        
        while pending.count > 0 {
            let k = pending.count
            for _ in 0..<k {
                var current = pending.removeFirst()
                
                if current == target {
                    return turns
                }
                
                for wheel in 0..<4 {
                    var new = Array(current)
                    new[wheel] = nextSlot[new[wheel]]!
                    let newStr = String(new)
                    
                    if !visited.contains(newStr) {
                        pending.append(newStr)
                        visited.insert(newStr)
                    }
                    
                    var prev = Array(current)
                    prev[wheel] = prevSlot[prev[wheel]]!
                    let prevStr = String(prev)
                    
                    if !visited.contains(prevStr) {
                        pending.append(prevStr)
                        visited.insert(prevStr)
                    }
                }
            }
            
            turns += 1
        }
        
        return -1
    }
}

print(Solution().numIslands([
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
])) // 1

print(Solution().numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
])) // 3

print(Solution().openLock(["0201","0101","0102","1212","2002"], "0202")) // 6
print(Solution().openLock(["8888"], "0009")) // 1
print(Solution().openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888")) // -1
