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
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return nums }
        let pivot = nums.count/2
        
        let left = sortArray(Array(nums[0..<pivot]))
        let right = sortArray(Array(nums[pivot..<nums.count]))
        
        var i = 0, j = 0
        
        var sorted = [Int]()
        while i < left.count || j < right.count {
            if i == left.count {
                sorted.append(right[j])
                j += 1
            } else if j == right.count {
                sorted.append(left[i])
                i += 1
                continue
            } else if left[i] <= right[j] {
                sorted.append(left[i])
                i += 1
            } else {
                sorted.append(right[j])
                j += 1
            }
        }
        
        return sorted
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        func helper(_ root: TreeNode?, _ min: TreeNode?, _ max: TreeNode?) -> Bool {
            guard let root else { return true }
            if let min, root.val <= min.val { return false }
            if let max, root.val >= max.val { return false }
            return helper(root.left, min, root) && helper(root.right, root, max)
        }
        
        return helper(root, nil, nil)
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        
        func findIn(startR: Int, endR: Int, startC: Int, endC: Int) -> Bool {
            if startR < 0 || startC < 0 || endR == matrix.count || endC == matrix[0].count { return false }
            if startR > endR || startC > endC { return false }
            let midR = (startR + endR) / 2
            let midC = (startC + endC) / 2
            
            let current = matrix[midR][midC]
            if matrix[midR][midC] == target { return true }
            
            if target < current {
                return findIn(startR: startR, endR: midR - 1, startC: startC, endC: midC - 1)
                || findIn(startR: startR, endR: midR, startC: startC, endC: midC - 1)
                || findIn(startR: startR, endR: midR - 1, startC: startC, endC: midC)
            }
            
            return findIn(startR: midR + 1, endR: endR, startC: midC + 1, endC: endC)
            || findIn(startR: midR + 1, endR: endR, startC: midC, endC: endC)
            || findIn(startR: midR, endR: endR, startC: midC + 1, endC: endC)
            
        }
        
        return findIn(startR: 0, endR: matrix.count, startC: 0, endC: matrix[0].count)
    }
}

print(Solution().sortArray([5,2,3,1])) // [1,2,3,5]
print(Solution().sortArray([0,0,1,1,2,5])) // [0,0,1,1,2,5]

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
let node4 = TreeNode(4)
let node5 = TreeNode(5)
let node6 = TreeNode(6)

node2.left = node1
node2.right = node3

print(Solution().isValidBST(node2)) // true

node5.left = node1
node5.right = node4
node4.left = node3
node4.right = node6

print(Solution().isValidBST(node5)) // false

let matrix1 = [
    [1,4,7,11,15],
    [2,5,8,12,19],
    [3,6,9,16,22],
    [10,13,14,17,24],
    [18,21,23,26,30]
]

print(Solution().searchMatrix(matrix1, 5))

let matrix2 = [
    [1,4,7,11,15],
    [2,5,8,12,19],
    [3,6,9,16,22],
    [10,13,14,17,24],
    [18,21,23,26,30]
]

print(Solution().searchMatrix(matrix2, 20))
