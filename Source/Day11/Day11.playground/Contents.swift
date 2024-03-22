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

