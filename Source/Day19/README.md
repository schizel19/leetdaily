#  [Day 19 - Queue & Stack: Stack (pt. 2)](https://leetcode.com/explore/learn/card/queue-stack/230/usage-stack/)

## 1. Min Stack

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the MinStack class:

MinStack() initializes the stack object.
void push(int val) pushes the element val onto the stack.
void pop() removes the element on the top of the stack.
int top() gets the top element of the stack.
int getMin() retrieves the minimum element in the stack.
You must implement a solution with O(1) time complexity for each function.

## 2. Valid Parentheses

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.

 
```
Input: s = "()"
Output: true
```

```
Input: s = "()[]{}"
Output: true
```

```
Input: s = "(]"
Output: false
```
