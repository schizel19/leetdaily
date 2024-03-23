
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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
