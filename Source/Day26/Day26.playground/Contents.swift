
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
}

print(Solution().totalNQueens(1)) // 1
print(Solution().totalNQueens(4)) // 2
