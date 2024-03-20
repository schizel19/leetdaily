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
    
    // using counting
    static func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var headACount = 0
        var headBCount = 0
        var head1 = headA
        var head2 = headB
        
        if headA === headB { return headA }
        
        while head1?.next != nil || head2?.next != nil {
            if head1?.next != nil {
                headACount += 1
                head1 = head1?.next
            }
            
            if head2?.next != nil {
                headBCount += 1
                head2 = head2?.next
            }
        }
        
        guard head1 === head2 else { return nil }
        
        head1 = headA
        head2 = headB
        if headACount > headBCount {
            for _ in 0..<(headACount - headBCount) {
                head1 = head1?.next
            }
        } else {
            for _ in 0..<(headBCount - headACount) {
                head2 = head2?.next
            }
        }
        
        while (head1?.next != nil || head2?.next != nil), head1 !== head2 {
            head1 = head1?.next
            head2 = head2?.next
        }
        
        return head1
    }
    
    // elegant
    static func getIntersectionNode2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var p1 = headA
        var p2 = headB
        
        while p1 !== p2 {
            p1 = (p1 == nil) ? headB : p1?.next
            p2 = (p2 == nil) ? headA : p2?.next
        }
        
        return p1
    }
    
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var node = ListNode(0)
        node.next = head
        
        var fast: ListNode? = node
        var slow: ListNode? = node

        for _ in 0...n {
            fast = fast?.next
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        return node.next
    }
}

let node1 = ListNode(3)
let node2 = ListNode(2)
let node3 = ListNode(0)
let node4 = ListNode(4)

node1.next = node2
node2.next = node3
node3.next = node4

node4.next = node2

print(Solution.hasCycle(node1))
print(Solution.detectCycle(node1)?.val)

node4.next = nil

print(Solution.hasCycle(node1))
print(Solution.detectCycle(node1)?.val)

node1.next = node2
node2.next = node3
node3.next = node4

let node5 = ListNode(6)
let node6 = ListNode(7)
let node7 = ListNode(8)

node5.next = node6
node6.next = node2

print(Solution.getIntersectionNode(node1, node5) === node2)
print(Solution.getIntersectionNode(node1, node5)?.val)

node6.next = node7

print(Solution.getIntersectionNode(node1, node5)?.val)


let nodeA = ListNode(4)
let nodeB = ListNode(1)
let nodeC = ListNode(8)
let nodeD = ListNode(6)
let nodeE = ListNode(5)

let nodeF = ListNode(5)
let nodeG = ListNode(6)
let nodeH = ListNode(1)

nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeD
nodeD.next = nodeE

nodeF.next = nodeG
nodeG.next = nodeH
nodeH.next = nodeC

print(Solution.getIntersectionNode(nodeA, nodeF) === nodeC)
print(Solution.getIntersectionNode(nodeA, nodeF)?.val)
print("debug ====")

// 4 1 8 6 5 -> 4 1 6 5
var head = Solution.removeNthFromEnd(nodeA, 3)
while head != nil {
    print(head?.val)
    head = head?.next
}
