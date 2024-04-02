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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [root]
        
        while !stack.isEmpty {
            guard let node = stack.removeLast() else { continue }
            result.append(node.val)
            stack.append(node.right)
            stack.append(node.left)
        }
        
        return result
    }
}

print(Solution().preorderTraversal(node1)) // [1, 2, 3]
