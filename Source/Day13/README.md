#  [Day 13 - Recursion I: Challenge (pt.2)](https://leetcode.com/explore/learn/card/recursion-i/256/complexity-analysis/)

## 1. Maximum Depth of Binary Tree

Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Example 1:
![Image](https://assets.leetcode.com/uploads/2020/11/26/tmp-tree.jpg)

```
Input: root = [3,9,20,null,null,15,7]
Output: 3
```

## 2. Pow(x,n)

Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

```
Input: x = 2.00000, n = 10
Output: 1024.00000
```

```
Input: x = 2.10000, n = 3
Output: 9.26100
```

## 3. Merge two sorted lists

You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

Example 1:
![Example:](https://assets.leetcode.com/uploads/2020/10/03/merge_ex1.jpg)

```
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]
```

## 4. K-th Symbol in Grammar

We build a table of n rows (1-indexed). We start by writing 0 in the 1st row. Now in every subsequent row, we look at the previous row and replace each occurrence of 0 with 01, and each occurrence of 1 with 10.

For example, for n = 3, the 1st row is 0, the 2nd row is 01, and the 3rd row is 0110.
Given two integer n and k, return the kth (1-indexed) symbol in the nth row of a table of n rows.

```
Input: n = 1, k = 1
Output: 0
Explanation: row 1: 0
```

```
Input: n = 2, k = 1
Output: 0
Explanation: 
row 1: 0
row 2: 01
```

```
Input: n = 2, k = 2
Output: 1
Explanation: 
row 1: 0
row 2: 01
```




