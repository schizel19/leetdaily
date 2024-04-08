class Trie {
    fileprivate class Node {
        var text: String?
        var children = [Character: Node]()
        var isWord: Bool = false
    }
    
    private var root = Node()
    
    init() {
        
    }
    
    func insert(_ word: String) {
        var current = root
        for char in word {
            if let node = current.children[char] {
                current = node
            } else {
                let node = Node()
                current.children[char] = node
                current = node
            }
        }
        current.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        var current = root
        for char in word {
            if let node = current.children[char] {
                current = node
            } else {
                return false
            }
        }
        return current.isWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var current = root
        for char in prefix {
            if let node = current.children[char] {
                current = node
            } else {
                return false
            }
        }
        return true
    }
}

let trie = Trie()
trie.insert("apple")
print(trie.search("apple")) // true
print(trie.search("app")) // false
print(trie.startsWith("app")) // true
trie.insert("app")
print(trie.search("app")) // true
