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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if inorder.isEmpty || preorder.isEmpty { return nil }
        var preorder = preorder
        
        func helper(left: Int, right: Int) -> TreeNode? {
            if left > right { return nil }
            let root = TreeNode(preorder.removeFirst())
            let index = inorder.firstIndex(of: root.val)!
            
            root.left = helper(left: left, right: index - 1)
            root.right = helper(left: index + 1, right: right)
            
            return root
        }
       
        return helper(left: 0, right: inorder.count - 1)
    }
}

let node = Solution().buildTree([3,9,20,15,7], [9,3,15,20,7]) // [3,9,20,null,null,15,7]
print(node!.val) // 3
