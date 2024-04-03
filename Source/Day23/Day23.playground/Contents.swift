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

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)

node1.right = node2
node2.left = node3

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
    
    // recursive
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        
        func isMirror(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
            if node1 == nil, node2 == nil { return true }
            if node1 == nil || node2 == nil { return false }
            if node1!.val != node2!.val { return false }
            return isMirror(node1?.left, node2?.right) && isMirror(node1?.right, node2?.left)
        }
        
        return isMirror(root?.left, root?.right)
    }
}

print(Solution().maxDepth(node1))

let nodeA = TreeNode(1)
let nodeB = TreeNode(2)
let nodeC = TreeNode(3)
let nodeD = TreeNode(4)
let nodeF = TreeNode(2)
let nodeG = TreeNode(3)
let nodeH = TreeNode(4)

nodeA.left = nodeB
nodeA.right = nodeF
nodeB.left = nodeC
nodeB.right = nodeD
nodeF.left = nodeH
nodeF.right = nodeG

print(Solution().isSymmetric(nodeA)) // true

nodeA.left = nodeB
nodeA.right = nodeF
nodeB.left = nil
nodeB.right = nodeC
nodeF.left = nil
nodeF.right = nodeG

print(Solution().isSymmetric(nodeA)) // false
