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
