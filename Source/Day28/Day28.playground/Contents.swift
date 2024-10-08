class Trie {
    fileprivate class Node {
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

class MapSum {
    class Node {
        var children = [Character: Node]()
        var score = 0
    }
    
    private var sums = [String: Int]()
    private var root = Node()
    
    init() {
        
    }
    
    func insert(_ key: String, _ val: Int) {
        let delta = val - sums[key, default: 0]
        sums[key] = val
        
        var current = root
        current.score += delta
        
        for char in key {
            if let node = current.children[char] {
                current = node
            } else {
                let node = Node()
                current.children[char] = node
                current = node
            }
            current.score += delta
        }
    }
    
    func sum(_ prefix: String) -> Int {
        var current = root
        for char in prefix {
            guard let node = current.children[char] else { return 0 }
            current = node
        }
        return current.score
    }
}

let mapSum = MapSum()
mapSum.insert("apple", 3)
mapSum.sum("ap") // 3
mapSum.insert("app", 2)
mapSum.sum("ap") // 5

class Solution {
    class SearchTrie {
        class Node {
            var children = [Character: Node]()
            var isWord: Bool = false
        }
        
        private var root = Node()
        
        func insert(_ word: String) {
            var current = root
            for char in word {
                var node = current.children[char] ?? .init()
                current.children[char] = node
                current = node
            }
            current.isWord = true
        }
        
        func replace(_ word: String) -> String {
            var current = root
            var prefix = ""
            var isPrefix: Bool = false
            for char in word {
                if current.isWord {
                    break
                }
                
                if let node = current.children[char] {
                    prefix += "\(char)"
                    current = node
                } else {
                    break
                }
            }
            
            if current.isWord {
                isPrefix = true
            }
            
            return isPrefix ? prefix : word
        }
    }
    
    
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let trie = SearchTrie()
        for word in dictionary {
            trie.insert(word)
        }
        
        return sentence.split(separator: " ").map { trie.replace(String($0)) }.joined(separator: " ")
    }
}

print(Solution().replaceWords(["cat","bat","rat"], "the cattle was rattled by the battery")) //"the cat was rat by the bat"
