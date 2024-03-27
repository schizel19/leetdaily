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
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var results = [TreeNode?]()
        var seen = [Int: Bool]()
        
        func enumerate(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            let hash = [node.val, enumerate(node.left), enumerate(node.right)].hashValue
            if seen[hash] == true {
                results.append(node)
            }
            seen[hash] = seen[hash] == nil
            return hash
        }
        
        _ = enumerate(root)
        
        return results
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


let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
let node4 = TreeNode(4)
let node5 = TreeNode(2)
let node6 = TreeNode(4)
let node7 = TreeNode(4)

node1.left = node2
node1.right = node3

node2.left = node4

node3.left = node5
node3.right = node7

node5.left = node6

print(Solution().findDuplicateSubtrees(node1).map { $0?.val }) // 2, 4
