#  [Day 29 - Trie: Practical Application II (pt. 2)](https://leetcode.com/explore/learn/card/trie/149/practical-application-ii/1057/)

## 1. Add and Search Word - Data structure design

Design a data structure that supports adding new words and finding if a string matches any previously added string.

Implement the WordDictionary class:

* WordDictionary() Initializes the object.
* void addWord(word) Adds word to the data structure, it can be matched later.
* bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
 
Example:
```
Input
["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
Output
[null,null,null,null,false,true,true,true]

Explanation
WordDictionary wordDictionary = new WordDictionary();
wordDictionary.addWord("bad");
wordDictionary.addWord("dad");
wordDictionary.addWord("mad");
wordDictionary.search("pad"); // return False
wordDictionary.search("bad"); // return True
wordDictionary.search(".ad"); // return True
wordDictionary.search("b.."); // return True
```

Constraints:

* 1 <= word.length <= 25
* word in addWord consists of lowercase English letters.
* word in search consist of '.' or lowercase English letters.
* There will be at most 2 dots in word for search queries.
* At most 104 calls will be made to addWord and search.

## 2. Maximum XOR of Two Numbers in an Array

Given an integer array nums, return the maximum result of nums[i] XOR nums[j], where 0 <= i <= j < n.

Example 1:
```
Input: nums = [3,10,5,25,2,8]
Output: 28
Explanation: The maximum result is 5 XOR 25 = 28.
```

Example 2:
```
Input: nums = [14,70,53,83,49,91,36,80,92,51,66,70]
Output: 127
```

Constraints:
* 1 <= nums.length <= 2 * 105
* 0 <= nums[i] <= 231 - 1
