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
    
    // iterative
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        var visitedLeft = Set<Int>()
        var visitedRight = Set<Int>()
        var queue = [(TreeNode, Bool)]()
        
        if root?.left == nil || root?.right == nil { return false }
        
        queue.append((root!.left!, false))
        queue.append((root!.right!, true))
        
        while !queue.isEmpty {
            let (curr, direction) = queue.removeFirst()
            if direction == false {
                if visitedRight.contains(curr.val) {
                    visitedRight.remove(curr.val)
                } else {
                    visitedLeft.insert(curr.val)
                }
            } else {
                if visitedLeft.contains(curr.val) {
                    visitedLeft.remove(curr.val)
                } else {
                    visitedRight.insert(curr.val)
                }
            }
            if curr.left != nil {
                queue.append((curr.left!, false))
            }
            
            if curr.right != nil {
                queue.append((curr.right!, true))
            }
        }
        
        return visitedLeft.isEmpty && visitedRight.isEmpty
    }
    
    func isSymmetric3(_ root: TreeNode?) -> Bool {
        var stack = [root?.left, root?.right]
        while !stack.isEmpty {
            let node1 = stack.removeLast()
            let node2 = stack.removeLast()
            
            if node1 == nil, node2 == nil, stack.isEmpty { break }
            if node1 == nil, node2 == nil, !stack.isEmpty { continue }
            if node1 == nil || node2 == nil { return false }
            if node1!.val != node2!.val { return false }
            stack.append(node1?.left)
            stack.append(node2?.right)
            stack.append(node1?.right)
            stack.append(node2?.left)
        }
        
        return true
    }
    
    // iterative
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else { return false }
        var stack: [(TreeNode, Int)] = [(root, 0)]
        
        while !stack.isEmpty {
            let (curr, sum) = stack.removeFirst()
            if curr.left == nil, curr.right == nil, curr.val + sum == targetSum {
                return true
            }
            if curr.left != nil {
                stack.append((curr.left!, curr.val + sum))
            }
            if curr.right != nil {
                stack.append((curr.right!, curr.val + sum))
            }
        }
        
        return false
    }
    
    // recursive
    func hasPathSum2(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else { return false }
        if root.left == nil, root.right == nil, root.val == targetSum {
            return true
        }
        return hasPathSum2(root.left, targetSum - root.val) || hasPathSum2(root.right, targetSum - root.val)
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
print(Solution().isSymmetric2(nodeA)) // true
print(Solution().isSymmetric3(nodeA)) // true

nodeA.left = nodeB
nodeA.right = nodeF
nodeB.left = nil
nodeB.right = nodeC
nodeF.left = nil
nodeF.right = nodeG

print(Solution().isSymmetric(nodeA)) // false
print(Solution().isSymmetric2(nodeA)) // false
print(Solution().isSymmetric3(nodeA)) // false

let nodeP9 = TreeNode(1)
let nodeP8 = TreeNode(2)
let nodeP7 = TreeNode(7)
let nodeP6 = TreeNode(4, nil, nodeP9)
let nodeP5 = TreeNode(13)
let nodeP4 = TreeNode(11, nodeP7, nodeP8)
let nodeP3 = TreeNode(8, nodeP5, nodeP6)
let nodeP2 = TreeNode(4, nodeP4, nil)
let nodeP1 = TreeNode(5, nodeP2, nodeP3)

let nodeA3 = TreeNode(3)
let nodeA2 = TreeNode(2)
let nodeA1 = TreeNode(1, nodeA2, nodeA3)

print(Solution().hasPathSum(nodeP1, 22)) // true
print(Solution().hasPathSum(nodeA1, 5)) // false
print(Solution().hasPathSum(nil, 0)) // false

print(Solution().hasPathSum2(nodeP1, 22)) // true
print(Solution().hasPathSum2(nodeA1, 5)) // false
print(Solution().hasPathSum2(nil, 0)) // false


