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
    
    static func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        var count = 0
        while slow?.next != nil, fast?.next?.next != nil {
            count += 1
            var currentFast = fast
            slow = slow?.next
            fast = fast?.next?.next
            
            if let s = slow, let f = fast, s === f {
                slow = head
                while slow !== fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                return slow
            }
        }
        
        return nil
    }
}

let node1 = ListNode(3)
let node2 = ListNode(2)
let node3 = ListNode(0)
let node4 = ListNode(4)

let node5 = ListNode(6)

node1.next = node2
node2.next = node3
node3.next = node4

node4.next = node2

//node4.next = node5
//node5.next = node1

print(Solution.hasCycle(node1))
print(Solution.detectCycle(node1)?.val)


node4.next = nil
//node5.next = nil

print(Solution.hasCycle(node1))
print(Solution.detectCycle(node1)?.val)
