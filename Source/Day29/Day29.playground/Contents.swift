
class WordDictionary {
    
    class Node {
        var isWord: Bool = false
        var next = [Character: Node]()
    }
    
    var root = Node()
    
    init() {
        
    }
    
    func addWord(_ word: String) {
        var current = root
        for char in word {
            let node = current.next[char] ?? Node()
            current.next[char] = node
            current = node
        }
        current.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        search(word, in: root)
    }
    
    func search(_ word: String, in node: Node) -> Bool {
        var current = node
        for (index, char) in word.enumerated() {
            if char == "." {
                for key in current.next.keys {
                    if search(String(Array(word)[index+1..<word.count]), in: current.next[key]!) {
                        return true
                    }
                }
                return false
            }
            if let next = current.next[char] {
                current = next
            } else {
                return false
            }
        }
        return current.isWord
    }
    
    
}

let wordDictionary = WordDictionary()
wordDictionary.addWord("bad")
wordDictionary.addWord("dad")
wordDictionary.addWord("mad")
wordDictionary.search("pad") // false
wordDictionary.search("bad") // true
wordDictionary.search(".ad") // true
wordDictionary.search("b..") // true

let wordDictionary2 = WordDictionary()
wordDictionary2.addWord("a")
wordDictionary2.addWord("a")
wordDictionary2.search(".")
wordDictionary2.search("a")
wordDictionary2.search("aa")


class IntegerTrie {
    class Node {
        var children: [Node?] = Array(repeating: nil, count: 2)
    }
    
    let root = Node()
    
    func insert(_ num: Int) {
        var current = root
        for i in stride(from: 31, through: 0, by: -1) {
            let bit = (num >> i) & 1
            let node = current.children[bit] ?? Node()
            current.children[bit] = node
            current = node
        }
    }
}

class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        let trie = IntegerTrie()
        
        for num in nums {
            trie.insert(num)
        }
        
        var maxXOR = 0
        
        for num in nums {
            var current = trie.root
            var result = 0
            
            for i in stride(from: 31, through: 0, by: -1) {
                let bit = (num >> i) & 1
                let oppositeBit = bit ^ 1
                
                if let next = current.children[oppositeBit] {
                    result |= (1 << i)
                    current = next
                } else {
                    current = current.children[bit]!
                }
            }
            
            maxXOR = max(maxXOR, result)
        }
        
        return maxXOR
    }
}

print(Solution().findMaximumXOR([3,10,5,25,2,8])) // 28
print(Solution().findMaximumXOR([14,70,53,83,49,91,36,80,92,51,66,70])) //127

