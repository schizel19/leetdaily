
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
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n < 0 { return myPow(1/x, -n) }
        return n % 2 == 0 ? myPow(x * x, n/2) : x * myPow(x * x, n/2)
    }
}


let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
let node4 = TreeNode(4)

node1.left = node2
node1.right = node3
node3.right = node4

print(Solution().maxDepth(node1))
print(Solution().myPow(2.0, 10))
print(Solution().myPow(2.1, 3))
print(Solution().myPow(2.0, -2))
print(Solution().myPow(0.00001, 2147483647))
