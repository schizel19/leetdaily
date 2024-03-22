class ListNode {
    public var val: Int
    public var prev: ListNode?
    public var next: ListNode?
    
    public init(_ val: Int, _ prev: ListNode? = nil, _ next: ListNode? = nil) {
        self.val = val
        self.prev = prev
        self.next = next
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
let node5 = ListNode(5)
let node6 = ListNode(6)
let node7 = ListNode(7)

let nodeA = ListNode(8)
let nodeB = ListNode(9)
let nodeC = ListNode(10)
let nodeD = ListNode(11)
let nodeE = ListNode(12)
let nodeF = ListNode(13)


class Solution {
    static func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let parent = ListNode(-1)
        var head: ListNode? = parent
        var l1 = list1
        var l2 = list2
        
        while l1 != nil || l2 != nil {
            var next: ListNode?
            
            if let val1 = l1?.val, let val2 = l2?.val {
                if val1 < val2 {
                    next = l1
                    l1 = l1?.next
                } else {
                    next = l2
                    l2 = l2?.next
                }
            } else if l1 != nil {
                next = l1
                l1 = l1?.next
            } else {
                next = l2
                l2 = l2?.next
            }
            
            
            head?.next = next
            head = next
        }
        
        return parent.next
    }
    
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let parent = ListNode(0)
        var carry = 0
        var head = parent
        var l1 = l1
        var l2 = l2
        
        while l1 != nil || l2 != nil {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            let node = ListNode(sum % 10)
            carry = sum/10
            l1 = l1?.next
            l2 = l2?.next
            head.next = node
            head = node
        }
        
        if carry == 1 {
            head.next = ListNode(1)
        }
        
        return parent.next
    }
}

// [1, 2, 4, 5] + [3, 6] = [1, 2, 3, 4, 5, 6]
node1.next = node2
node2.next = node4
node4.next = node5

node3.next = node6

list(head: Solution.mergeTwoLists(node1, node3))


// 315
node5.next = node1
node1.next = node3
node3.next = nil

// 724
node4.next = node2
node2.next = node7
node7.next = nil

// 724 + 315 = 1039
list(head: Solution.addTwoNumbers(node5, node4))
