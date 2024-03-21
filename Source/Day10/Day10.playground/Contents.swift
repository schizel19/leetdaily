class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
}

func list(head: ListNode?) {
    var vals = [String]()
    var head = head
    while head != nil {
        vals.append("\(head?.val)")
        head = head?.next
        
        if vals.count == 6 {
            print(vals)
            break
        }
    }
    print(vals.joined(separator: ", "))
}

class Solution {
    static func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var newHead: ListNode?
        
        while head != nil {
            let nextHead = head?.next
            head?.next = newHead
            newHead = head
            head = nextHead
        }
        
        return newHead
    }
    
    static func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var newHead: ListNode? = ListNode(0)
        newHead!.next = head
        var slowHead = newHead
        var head = head
        while head != nil {
            if head!.val == val {
                slowHead?.next = head?.next
            } else {
                slowHead = head
            }
            head = head?.next
        }
        return newHead!.next
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
let node6 = ListNode(6)
let node7 = ListNode(7)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

list(head: Solution.reverseList(node1)) // 5, 4, 3, 2, 1

node6.next = node7

list(head: Solution.reverseList(node6)) // 7, 6

list(head: Solution.reverseList(nil)) // nil

list(head: Solution.removeElements(node5, 1)) // 5, 4, 3, 2
