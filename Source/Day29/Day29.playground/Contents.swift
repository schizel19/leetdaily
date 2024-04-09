
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



