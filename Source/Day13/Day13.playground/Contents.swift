import Foundation

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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public func list() {
        var vals = [String]()
        var head: ListNode? = self
        while head != nil {
            vals.append("\(head?.val)")
            head = head?.next
            if vals.count == 1000 {
                print(vals)
                break
            }
        }
        print(vals.isEmpty ? "empty" : vals.joined(separator: ", "))
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
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        if list1!.val < list2!.val {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists(list1, list2?.next)
            return list2
        }
    }
    
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        if n == 1 { return 0 }
        let totalElements = Int(pow(2.0, Double(n - 1)))
        let halfElements = totalElements/2
        
        if k > halfElements {
            return 1 - kthGrammar(n, k - halfElements)
        }
        
        return kthGrammar(n - 1, k)
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


let nodeA = ListNode(1)
let nodeB = ListNode(2)
let nodeC = ListNode(4)
let nodeD = ListNode(1)
let nodeE = ListNode(3)
let nodeF = ListNode(4)

nodeA.next = nodeB
nodeB.next = nodeC

nodeD.next = nodeE
nodeE.next = nodeF

// 1, 2, 4 + 1, 3, 4 = 1, 1, 2, 3, 4, 4
Solution().mergeTwoLists(nodeA, nodeD)?.list()


print(Solution().kthGrammar(1, 1))
print(Solution().kthGrammar(2, 1))
print(Solution().kthGrammar(2, 2))
