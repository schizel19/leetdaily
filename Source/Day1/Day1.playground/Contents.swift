import UIKit

class Solution {
    /// simple
    static func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        var running = [Int]()
        for num in nums {
            sum += num
            running.append(sum)
        }
        return running
    }
    
    /// functional
    static func runningSum2(_ nums: [Int]) -> [Int] {
        return nums.reduce(into: []) { newArr, num in
            newArr.append(num + (newArr.last ?? 0))
        }
    }
    
    /// simple
    static func maximumWealth(_ accounts: [[Int]]) -> Int {
        return accounts.map { $0.reduce(0, +) }.max()!
    }
    
    /// simple
    static func fizzBuzz(_ n: Int) -> [String] {
        (1...n).map {
            if $0.isMultiple(of: 15) {
                return "FizzBuzz"
            } else if $0.isMultiple(of: 3) {
                return "Fizz"
            } else if $0.isMultiple(of: 5) {
                return "Buzz"
            }
            return "\($0)"
        }
    }
    
    /// simple
    static func numberOfSteps(_ num: Int) -> Int {
        var steps = 0
        var running = num
        while running > 0 {
            if running % 2 == 0 { running /= 2 }
            else { running -= 1}
            steps += 1
        }
        return steps
    }
    
    /// bitwise
    static func numberOfSteps2(_ num: Int) -> Int {
        if num == 0 { return 0 }
        return num.bitWidth - num.leadingZeroBitCount + num.nonzeroBitCount - 1
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    // simple
    func middleNode(_ head: ListNode?) -> ListNode? {
        var length = 0
        var node: ListNode? = head
        while node != nil {
            node = node?.next
            length += 1
        }
        
        length = (length / 2) + 1
        
        node = head
        for _ in 0..<length {
            node = node?.next
        }
        
        return node
    }
    
    // fast, slow
    func middleNode2(_ head: ListNode?) -> ListNode? {
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow
    }
}

print(Solution.runningSum([1,2,3,4]))
print(Solution.runningSum2([1,2,3,4]))
print(Solution.runningSum([5,10,35,50]))
print(Solution.runningSum2([5,10,35,50]))
print(Solution.maximumWealth([[1,2,3],[3,2,1]]))
print(Solution.fizzBuzz(15))
print(Solution.numberOfSteps(14))
print(Solution.numberOfSteps2(14))
