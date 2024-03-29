class MyCircularQueue {
    var head = 0
    var tail = -1
    var values: [Int]
    
    init(_ k: Int) {
        values = [Int](repeating: -1, count: k)
    }
    
    func enQueue(_ value: Int) -> Bool {
        let nextTail = (tail + 1) % values.count
        if nextTail == head, values[head] != -1 { return false }
        tail = nextTail
        values[tail] = value
        return true
    }
    
    func deQueue() -> Bool {
        guard values[head] != -1 else { return false }
        values[head] = -1
        head = (head + 1) % values.count
        return true
    }
    
    func Front() -> Int {
        values[head]
    }
    
    func Rear() -> Int {
        tail != -1 ? values[tail] : tail
    }
    
    func isEmpty() -> Bool {
        values[head] == -1
    }
    
    func isFull() -> Bool {
        return (tail + 1) % values.count == head && values[head] != -1
    }
}

let obj = MyCircularQueue(5)
print(obj.enQueue(8)) // true
print(obj.deQueue()) // true
print(obj.deQueue()) // false
print(obj.enQueue(2)) // true
print(obj.enQueue(3)) // true
print(obj.enQueue(4)) // true
print(obj.enQueue(5)) // true
print(obj.enQueue(6)) // true
print(obj.enQueue(7)) // false
print(obj.Front()) // 2
print(obj.Rear()) // 6
print(obj.isEmpty()) // false
print(obj.isFull()) // true
