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
    
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        if let root {
            result = [root.val]
            result += preorderTraversal2(root.left)
            result += preorderTraversal2(root.right)
        }
        
        return result
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var nodes = [TreeNode?]()
        var curr = root
        
        while !nodes.isEmpty || curr != nil {
            while curr != nil {
                nodes.append(curr)
                curr = curr?.left
            }
            curr = nodes.removeLast()
            result.append(curr!.val)
            curr = curr?.right
        }
        
        return result
    }
    
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        if let root {
            result += inorderTraversal2(root.left)
            result += [root.val]
            result += inorderTraversal2(root.right)
        }
        
        return result
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var nodes = [root]
        var visited = [false]
        
        while !nodes.isEmpty {
            let curr = nodes.removeLast()
            let v = visited.removeLast()
            if let curr {
                if v {
                    result.append(curr.val)
                } else {
                    nodes.append(curr)
                    visited.append(true)
                    nodes.append(curr.right)
                    visited.append(false)
                    nodes.append(curr.left)
                    visited.append(false)
                }
            }
        }
        
        return result
    }
    
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        if let root {
            result += postorderTraversal2(root.left)
            result += postorderTraversal2(root.right)
            result += [root.val]
        }
        
        return result
    }
}

print(Solution().preorderTraversal(node1)) // [1, 2, 3]
print(Solution().inorderTraversal(node1)) // [1, 3, 2]
print(Solution().postorderTraversal(node1)) // [3, 2, 1]

print(Solution().preorderTraversal2(node1)) // [1, 2, 3]
print(Solution().inorderTraversal2(node1)) // [1, 3, 2]
print(Solution().postorderTraversal2(node1)) // [3, 2, 1]
