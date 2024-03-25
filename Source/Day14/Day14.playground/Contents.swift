class MyHashSet {
    let size = 1000
    var array = [[Int]](repeating: .init(), count: 1000)
    
    init() {}
    
    func add(_ key: Int) {
        array[key % size].append(key)
    }
    
    func remove(_ key: Int) {
        array[key % size].removeAll(where: { $0 == key})
    }
    
    func contains(_ key: Int) -> Bool {
        array[key % size].contains(key)
    }
}

class MyHashMap {
    struct Data {
        let key: Int
        let val: Int
    }
    
    let size = 1000
    var array = [[Data]](repeating: .init(), count: 1000)

    
    init() {
        
    }
    
    func put(_ key: Int, _ value: Int) {
        remove(key)
        array[key % size].append(.init(key: key, val: value))
    }
    
    func get(_ key: Int) -> Int {
        return array[key % size].first(where: { $0.key == key })?.val ?? -1
    }
    
    func remove(_ key: Int) {
        if var index = array[key % size].firstIndex(where:  { $0.key == key }) {
            array[key % size].remove(at: index)
        }
    }
}

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var obj = Set<Int>()
        
        for num in nums {
            if obj.contains(num) { return true }
            obj.insert(num)
        }
        
        return false
    }
    
    func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        for num in nums {
            map[num] = map[num, default: 0] + 1
        }
        return map.first(where: { $0.value == 1 })!.key
    }
}


let obj = MyHashSet()
obj.add(1)
obj.remove(2)
print(obj.contains(3))
obj.add(1)
obj.add(2)
obj.add(3)
obj.remove(1)
print(obj.contains(3))
print(obj.contains(1))
obj.add(1000000)
obj.add(1000000)
print(obj.contains(0))


let obj2 = MyHashMap()
obj2.put(1, 1)
let ret_2: Int = obj2.get(1)
obj2.remove(1)
print(ret_2)
obj2.put(1000000, 1)

print(Solution().containsDuplicate([1, 2, 3, 1]))
