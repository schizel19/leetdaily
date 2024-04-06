
//def backtrack_nqueen(row = 0, count = 0):
//    for col in range(n):
//        # iterate through columns at the curent row.
//        if is_not_under_attack(row, col):
//            # explore this partial candidate solution, and mark the attacking zone
//            place_queen(row, col)
//            if row + 1 == n:
//                # we reach the bottom, i.e. we find a solution!
//                count += 1
//            else:
//                # we move on to the next row
//                count = backtrack_nqueen(row + 1, count)
//            # backtrack, i.e. remove the queen and remove the attacking zone.
//            remove_queen(row, col)
//    return count

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var col = Set<Int>()
        var posDiag = Set<Int>()
        var negDiag = Set<Int>()
        
        var count = 0
        
        func backtrack(_ r: Int) {
            if r == n {
                count += 1
                return
            }
            
            for c in  0..<n {
                if col.contains(c) || posDiag.contains(r + c) || negDiag.contains(r - c) { continue }
                col.insert(c)
                posDiag.insert(r + c)
                negDiag.insert(r - c)
                backtrack(r + 1)
                col.remove(c)
                posDiag.remove(r + c)
                negDiag.remove(r - c)
            }
        }
        
        backtrack(0)
        return count
    }
    
    func solveSudoku(_ board: inout [[Character]]) {
        let options: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        func isValid(_ r: Int, _ c: Int, _ char: Character) -> Bool {
            for i in 0..<9 {
                if board[r][i] == char {
                    return false
                }
                if board[i][c] == char {
                    return false
                }
                
                let dr = 3 * (r / 3) + i / 3
                let dc = 3 * (c / 3) + i % 3
                if board[dr][dc] == char {
                    return false
                }
            }
            
            return true
        }
        
        func solve() -> Bool {
            for r in 0..<board.count {
                for c in 0..<board.count {
                    if board[r][c] != "." {
                        continue
                    }

                    for char in options {
                        guard isValid(r, c, char) else { continue }
                        board[r][c] = char
                        if solve() {
                            return true
                        } else {
                            board[r][c] = "."
                        }
                    }
                    return false
                }
            }
            return true
        }
        
        solve()
    }
}

print(Solution().totalNQueens(1)) // 1
print(Solution().totalNQueens(4)) // 2

var board: [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]]

Solution().solveSudoku(&board)

let expectedResult: [[Character]] = [
    ["5","3","4","6","7","8","9","1","2"],
    ["6","7","2","1","9","5","3","4","8"],
    ["1","9","8","3","4","2","5","6","7"],
    ["8","5","9","7","6","1","4","2","3"],
    ["4","2","6","8","5","3","7","9","1"],
    ["7","1","3","9","2","4","8","5","6"],
    ["9","6","1","5","3","7","2","8","4"],
    ["2","8","7","4","1","9","6","3","5"],
    ["3","4","5","2","8","6","1","7","9"]]

print(board)
print(board == expectedResult) // true


