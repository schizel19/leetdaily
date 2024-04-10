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

class BSTIterator {

    private var node: TreeNode?
    private var stack = [TreeNode?]()
    init(_ root: TreeNode?) {
        node = root
    }
    
    func next() -> Int {
        while node != nil {
            stack.append(node)
            node = node?.left
        }
        var n = stack.removeLast()
        node = n?.right
        return n!.val
    }
    
    func hasNext() -> Bool {
        node != nil || !stack.isEmpty
    }
}

let nodeE = TreeNode(20)
let nodeD = TreeNode(9)
let nodeC = TreeNode(15, nodeD, nodeE)
let nodeB = TreeNode(3)
let nodeA = TreeNode(7, nodeB, nodeC)

let bst = BSTIterator(nodeA)
print(bst.next()) // 3
print(bst.next()) // 7
print(bst.hasNext()) // true
print(bst.next()) // 9
print(bst.hasNext()) // true
print(bst.next()) // 15
print(bst.hasNext()) // true
print(bst.next()) // 20
print(bst.hasNext()) // false
