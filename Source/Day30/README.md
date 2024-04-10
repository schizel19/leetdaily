#  [Day 30 - Binary Search Tree: Basic Operation (pt. 1)] (https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/140/introduction-to-a-bst/)

## 1. Binary Search Tree Iterator

Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):

* BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
* boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
* int next() Moves the pointer to the right, then returns the number at the pointer.

Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.

You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.

Example 1:
![Example](https://assets.leetcode.com/uploads/2018/12/25/bst-tree.png)

```
Input
["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
[[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
Output
[null, 3, 7, true, 9, true, 15, true, 20, false]

Explanation
BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
bSTIterator.next();    // return 3
bSTIterator.next();    // return 7
bSTIterator.hasNext(); // return True
bSTIterator.next();    // return 9
bSTIterator.hasNext(); // return True
bSTIterator.next();    // return 15
bSTIterator.hasNext(); // return True
bSTIterator.next();    // return 20
bSTIterator.hasNext(); // return False
```

Constraints:

* The number of nodes in the tree is in the range [1, 105].
* 0 <= Node.val <= 106
* At most 105 calls will be made to hasNext, and next.
 
Follow up:

* Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?

## 2. Insert into a Binary Search Tree

You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.

Example 1:
![Example](https://assets.leetcode.com/uploads/2020/10/05/insertbst.jpg)
```
Input: root = [4,2,7,1,3], val = 5
Output: [4,2,7,1,3,5]
Explanation: Another accepted tree is:
```
![Answer2](https://assets.leetcode.com/uploads/2020/10/05/bst.jpg)

Example 2:
```
Input: root = [40,20,60,10,30,50,70], val = 25
Output: [40,20,60,10,30,50,70,null,null,25]
```

Example 3:
```
Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
Output: [4,2,7,1,3,5]
```

Constraints:

* The number of nodes in the tree will be in the range [0, 104].
* -108 <= Node.val <= 108
* All the values Node.val are unique.
* -108 <= val <= 108
* It's guaranteed that val does not exist in the original BST.

## 3. Delete Node in a BST

Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

Basically, the deletion can be divided into two stages:

1. Search for a node to remove.
2. If the node is found, delete the node.

Example 1:
![Example](https://assets.leetcode.com/uploads/2020/09/04/del_node_1.jpg)

```
Input: root = [5,3,6,2,4,null,7], key = 3
Output: [5,4,6,2,null,null,7]
Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.
```
![Answer2](https://assets.leetcode.com/uploads/2020/09/04/del_node_supp.jpg)

Example 2:
```
Input: root = [5,3,6,2,4,null,7], key = 0
Output: [5,3,6,2,4,null,7]
Explanation: The tree does not contain a node with value = 0.
```

Example 3:
```
Input: root = [], key = 0
Output: []
```

Constraints:

* The number of nodes in the tree is in the range [0, 104].
* -105 <= Node.val <= 105
* Each node has a unique value.
* root is a valid binary search tree.
* -105 <= key <= 105

Follow up: Could you solve it with time complexity O(height of tree)?
