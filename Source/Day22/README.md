#  [Day 22 - Binary Tree: Traverse A Tree (pt. 1)](https://leetcode.com/explore/learn/card/data-structure-tree/)

## 1. Preorder Traversal

Given the root of a binary tree, return the preorder traversal of its nodes' values.

Example 1:
![Example](https://assets.leetcode.com/uploads/2020/09/15/inorder_1.jpg)

```
Input: root = [1,null,2,3]
Output: [1,2,3]
```

```
Input: root = []
Output: []
```

```
Input: root = [1]
Output: [1]
```

Constraints:

* The number of nodes in the tree is in the range [0, 100].
* -100 <= Node.val <= 100

## 2. Inorder Traversal

Given the root of a binary tree, return the inorder traversal of its nodes' values.

Example 1:
![Example](https://assets.leetcode.com/uploads/2020/09/15/inorder_1.jpg)

```
Input: root = [1,null,2,3]
Output: [1,3,2]
```

```
Input: root = []
Output: []
```

```
Input: root = [1]
Output: [1]
```

Constraints:

* The number of nodes in the tree is in the range [0, 100].
* -100 <= Node.val <= 100

## 3. Postorder Traversal

Given the root of a binary tree, return the postorder traversal of its nodes' values.

Example 1:
![Example](https://assets.leetcode.com/uploads/2020/08/28/pre1.jpg)

```
Input: root = [1,null,2,3]
Output: [3,2,1]
```

```
Input: root = []
Output: []
```

```
Input: root = [1]
Output: [1]
```

Constraints:

* The number of nodes in the tree is in the range [0, 100].
* -100 <= Node.val <= 100

## 4. Level Order Traversal

Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

Example 1:
![Example](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)

```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]
Example 2:
```

```
Input: root = [1]
Output: [[1]]
Example 3:
```

```
Input: root = []
Output: []
```

Constraints:
* The number of nodes in the tree is in the range [0, 2000].
* -1000 <= Node.val <= 1000
