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

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int, _ left: Node? = nil, _ right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
        self.next = nil
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
    
    func connect(_ root: Node?) -> Node? {
        guard let root else { return nil }
        var nodes = [(root, 0)]
        var level = 0
        while !nodes.isEmpty {
            var (current, l) = nodes.removeFirst()
            if let left = current.left {
                nodes.append((left, l + 1))
            }
            if let right = current.right {
                nodes.append((right, l + 1))
            }
            
            while nodes.first?.1 == level {
                let (next, _) = nodes.removeFirst()
                current.next = next
                current = next
                if let left = current.left {
                    nodes.append((left, l + 1))
                }
                if let right = current.right {
                    nodes.append((right, l + 1))
                }
            }
            level += 1
        }
        
        return root
    }
    
    func connect2(_ root: Node?) -> Node? {
        guard let root else { return nil }
        var current: Node? = root
        var next = root.left
        
        while current != nil, next != nil {
            current?.left?.next = current?.right
            if current?.next != nil {
                current?.right?.next = current?.next?.left
            }
            current = current?.next
            if current == nil {
                current = next
                next = current?.left
            }
        }
        return root
    }
    
    func connectII(_ root: Node?) -> Node? {
        var current = root
        var head, tail: Node?
        
        while current != nil {
            if current?.left != nil {
                if tail != nil {
                    tail?.next = current?.left
                    tail = current?.left
                } else {
                    tail = current?.left
                    head = current?.left
                }
            }
            if current?.right != nil {
                if tail != nil {
                    tail?.next = current?.right
                    tail = current?.right
                } else {
                    tail = current?.right
                    head = current?.right
                }
            }
            current = current?.next
            if current == nil {
                current = head
                head = nil
                tail = nil
            }
        }
        
        return root
    }
}

let node = Solution().buildTree([3,9,20,15,7], [9,3,15,20,7]) // [3,9,20,null,null,15,7]
print(node!.val) // 3

let nodeA = Node(7)
let nodeB = Node(6)
let nodeC = Node(5)
let nodeD = Node(4)
let nodeE = Node(3, nodeB, nodeA)
let nodeF = Node(2, nodeD, nodeC)
let nodeG = Node(1, nodeF, nodeE)

let n = Solution().connect(nodeG)
print(n!.val)

let n2 = Solution().connect2(nodeG)
print(n!.val)
