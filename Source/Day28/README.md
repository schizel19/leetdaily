#  [Day 28 - Trie: Practical Application I (pt. 1)](https://leetcode.com/explore/learn/card/trie/)

## 1. Implement Trie (Prefix Tree)

A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

Implement the Trie class:
* Trie() Initializes the trie object.
* void insert(String word) Inserts the string word into the trie.
* boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
* boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
 

Example 1:
```
Input
["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
Output
[null, null, true, false, true, null, true]

Explanation
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // return True
trie.search("app");     // return False
trie.startsWith("app"); // return True
trie.insert("app");
trie.search("app");     // return True
```

Constraints:

* 1 <= word.length, prefix.length <= 2000
* word and prefix consist only of lowercase English letters.
* At most 3 * 104 calls in total will be made to insert, search, and startsWith.

## 2. Map Sum Pairs

Design a map that allows you to do the following:

* Maps a string key to a given value.
* Returns the sum of the values that have a key with a prefix equal to a given string.

Implement the MapSum class:

MapSum() Initializes the MapSum object.
* void insert(String key, int val) Inserts the key-val pair into the map. If the key already existed, the original key-value pair will be overridden to the new one.
* int sum(string prefix) Returns the sum of all the pairs' value whose key starts with the prefix.

Example 1:

```
Input
["MapSum", "insert", "sum", "insert", "sum"]
[[], ["apple", 3], ["ap"], ["app", 2], ["ap"]]
Output
[null, null, 3, null, 5]

Explanation
MapSum mapSum = new MapSum();
mapSum.insert("apple", 3);  
mapSum.sum("ap");           // return 3 (apple = 3)
mapSum.insert("app", 2);    
mapSum.sum("ap");           // return 5 (apple + app = 3 + 2 = 5)
```

Constraints:

* 1 <= key.length, prefix.length <= 50
* key and prefix consist of only lowercase English letters.
* 1 <= val <= 1000
* At most 50 calls will be made to insert and sum.

## 3. Replace Words

In English, we have a concept called root, which can be followed by some other word to form another longer word - let's call this word successor. For example, when the root "an" is followed by the successor word "other", we can form a new word "another".

Given a dictionary consisting of many roots and a sentence consisting of words separated by spaces, replace all the successors in the sentence with the root forming it. If a successor can be replaced by more than one root, replace it with the root that has the shortest length.

Return the sentence after the replacement.

Example 1:
```
Input: dictionary = ["cat","bat","rat"], sentence = "the cattle was rattled by the battery"
Output: "the cat was rat by the bat"
```

Example 2:
```
Input: dictionary = ["a","b","c"], sentence = "aadsfasf absbs bbab cadsfafs"
Output: "a a b c"
```
Constraints:

* 1 <= dictionary.length <= 1000
* 1 <= dictionary[i].length <= 100
* dictionary[i] consists of only lower-case letters.
* 1 <= sentence.length <= 106
* sentence consists of only lower-case letters and spaces.
* The number of words in sentence is in the range [1, 1000]
* The length of each word in sentence is in the range [1, 1000]
* Every two consecutive words in sentence will be separated by exactly one space.
* sentence does not have leading or trailing spaces.
