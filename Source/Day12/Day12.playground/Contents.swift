
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

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

func list(head: ListNode?) {
    var vals = [String]()
    var head = head
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

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)

class Solution {
    static func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var sentry = ListNode(0, head?.next)
        let next = head?.next?.next
        head?.next?.next = head
        head?.next = swapPairs(next)
        return sentry.next
    }
    
    static func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let next = head?.next
        let newNode = reverseList(next)
        next?.next = head
        head?.next = nil
        return newNode
    }
    
    static func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root else { return nil }
        if root.val == val { return root }
        return searchBST(root.left, val) ?? searchBST(root.right, val)
    }
    
    static func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        
        var curr = [1]
        var prev = getRow(rowIndex - 1)
        
        for index in 1..<rowIndex {
            curr.append(prev[index - 1] + prev[index])
        }
        
        curr.append(1)
        
        return curr
    }
}

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = nil

list(head: Solution.swapPairs(node1))

node1.next = nil

list(head: Solution.swapPairs(node1))

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = nil

// 4, 3, 2, 1
list(head: Solution.reverseList(node1))


let treeNode1 = TreeNode(1)
let treeNode2 = TreeNode(2)
let treeNode3 = TreeNode(3)
let treeNode4 = TreeNode(4)
let treeNode7 = TreeNode(7)

treeNode4.left = treeNode2
treeNode4.right = treeNode7
treeNode2.left = treeNode1
treeNode2.right = treeNode3

print(Solution.searchBST(treeNode4, 2) === treeNode2)
print(Solution.searchBST(treeNode4, 7) === treeNode7)
print(Solution.searchBST(treeNode4, 1) === treeNode1)
print(Solution.searchBST(treeNode4, 3) === treeNode3)

print(Solution.getRow(0)) // 0
print(Solution.getRow(1)) // 1
print(Solution.getRow(3)) // 1, 3, 3, 1
