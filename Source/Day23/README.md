#  [Day 23 - Binary Tree: Challenge (pt. 2)](https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/)

## 1. Maximum Depth of Binary Tree

Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Example 1:
![Example](https://assets.leetcode.com/uploads/2020/11/26/tmp-tree.jpg)

```
Input: root = [3,9,20,null,null,15,7]
Output: 3
```

Example 2:

```
Input: root = [1,null,2]
Output: 2
```

Constraints:

* The number of nodes in the tree is in the range [0, 104].
* -100 <= Node.val <= 100

## 2.  Symmetric Tree

Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

Example 1:
![Example](https://assets.leetcode.com/uploads/2021/02/19/symtree1.jpg)

```
Input: root = [1,2,2,3,4,4,3]
Output: true
```

Example 2:
![Example](https://assets.leetcode.com/uploads/2021/02/19/symtree2.jpg)
```
Input: root = [1,2,2,null,3,null,3]
Output: false
```

Constraints:
* The number of nodes in the tree is in the range [1, 1000].
* -100 <= Node.val <= 100

Follow up: Could you solve it both recursively and iteratively?
