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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var nodes = [p, q]
        
        while !nodes.isEmpty {
            let (p, q) = (nodes.removeFirst(), nodes.removeFirst())
            if p == nil, q == nil { continue }
            if p == nil || q == nil { return false }
            if p!.val != q!.val { return false }
            nodes.append(p?.left)
            nodes.append(q?.left)
            nodes.append(p?.right)
            nodes.append(q?.right)
        }
        
        return true
    }
}

let node3 = TreeNode(3)
let node2 = TreeNode(2)
let node1 = TreeNode(1, node2, node3)

let nodeC = TreeNode(3)
let nodeB = TreeNode(2)
let nodeA = TreeNode(1, nodeB, nodeC)

let nodeT3 = TreeNode(1)
let nodeT2 = TreeNode(2)
let nodeT1 = TreeNode(1, nodeT2, nodeT3)

print(Solution().isSameTree(node1, nodeA)) // true
print(Solution().isSameTree(node1, nodeT1)) // false


