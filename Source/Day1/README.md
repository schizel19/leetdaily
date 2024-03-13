# Day 1 - Beginner Challenge Problems

[Ref](https://leetcode.com/explore/learn/card/the-leetcode-beginners-guide/679/sql-syntax/4357/)

## 1. Running Sum of 1d Array

Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

Return the running sum of nums.

> Input: nums = [1,2,3,4]
> Output: [1,3,6,10]
> Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

## 2. Richest Customer Wealth

You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank. Return the wealth that the richest customer has.

A customer's wealth is the amount of money they have in all their bank accounts. The richest customer is the customer that has the maximum wealth.

> Input: accounts = [[1,2,3],[3,2,1]]
> Output: 6
> Explanation:
> 1st customer has wealth = 1 + 2 + 3 = 6
> 2nd customer has wealth = 3 + 2 + 1 = 6
> Both customers are considered the richest with a wealth of 6 each, so return 6.

## 3. Fizz Buzz

Given an integer n, return a string array answer (1-indexed) where:

* answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
* answer[i] == "Fizz" if i is divisible by 3.
* answer[i] == "Buzz" if i is divisible by 5.
* answer[i] == i (as a string) if none of the above conditions are true.

> Input: n = 3
> Output: ["1","2","Fizz"]


## 4. Number of Steps to Reduce a Number to Zero

Given an integer num, return the number of steps to reduce it to zero.

In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

> Input: num = 14
> Output: 6
> Explanation: 
> Step 1) 14 is even; divide by 2 and obtain 7. 
> Step 2) 7 is odd; subtract 1 and obtain 6.
> Step 3) 6 is even; divide by 2 and obtain 3. 
> Step 4) 3 is odd; subtract 1 and obtain 2. 
> Step 5) 2 is even; divide by 2 and obtain 1. 
> Step 6) 1 is odd; subtract 1 and obtain 0.

## 5. Middle of the Linked List

Given the head of a singly linked list, return the middle node of the linked list.

If there are two middle nodes, return the second middle node.

> Input: head = [1,2,3,4,5]
> Output: [3,4,5]
> Explanation: The middle node of the list is node 3.

## 6. Ransom Note

Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

Each letter in magazine can only be used once in ransomNote.

> Input: ransomNote = "a", magazine = "b"
> Output: false

