class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
}

class Solution {
    static func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while slow?.next != nil, fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if let slow, let fast {
                if slow === fast { return true }
            }
        }
        
        return false
    }
}

let node1 = ListNode(0)
let node2 = ListNode(1)
let node3 = ListNode(2)
let node4 = ListNode(3)
let node5 = ListNode(4)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node1

print(Solution.hasCycle(node1))

node5.next = nil

print(Solution.hasCycle(node1))
