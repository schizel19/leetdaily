class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.count == 1 { return [strs] }
        var anagrams = [String: [String]]()
        
        for str in strs {
            anagrams["\(str.sorted())"] = anagrams["\(str.sorted())", default: []] + [str]
        }
        
        return anagrams.map { $0.value }
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [String: Set<Character>]()
        var cols = [String: Set<Character>]()
        var squares = [String: Set<Character>]()
        
        for (i, _) in board.enumerated() {
            for (j, val) in board[i].enumerated() {
                if val == "." { continue }
                if rows["\(i)", default: []].contains(val)
                    || cols["\(j)", default: []].contains(val)
                    || squares["\(i/3)\(j/3)", default: []].contains(val) {
                    return false
                }
                
                rows["\(i)", default: []].insert(val)
                cols["\(j)", default: []].insert(val)
                squares["\(i/3)\(j/3)", default: []].insert(val)
            }
        }
        
        return true
    }
}

print(Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"])) //[["bat"],["nat","tan"],["ate","eat","tea"]]
print(Solution().groupAnagrams([""])) //[[""]]
print(Solution().groupAnagrams(["a"])) // [["a"]]


let board1: [[Character]] =
                [["5","3",".",".","7",".",".",".","."]
                ,["6",".",".","1","9","5",".",".","."]
                ,[".","9","8",".",".",".",".","6","."]
                ,["8",".",".",".","6",".",".",".","3"]
                ,["4",".",".","8",".","3",".",".","1"]
                ,["7",".",".",".","2",".",".",".","6"]
                ,[".","6",".",".",".",".","2","8","."]
                ,[".",".",".","4","1","9",".",".","5"]
                ,[".",".",".",".","8",".",".","7","9"]]

print(Solution().isValidSudoku(board1)) // true

let board2: [[Character]] =
            [["8","3",".",".","7",".",".",".","."]
            ,["6",".",".","1","9","5",".",".","."]
            ,[".","9","8",".",".",".",".","6","."]
            ,["8",".",".",".","6",".",".",".","3"]
            ,["4",".",".","8",".","3",".",".","1"]
            ,["7",".",".",".","2",".",".",".","6"]
            ,[".","6",".",".",".",".","2","8","."]
            ,[".",".",".","4","1","9",".",".","5"]
            ,[".",".",".",".","8",".",".","7","9"]]


print(Solution().isValidSudoku(board2)) // false

