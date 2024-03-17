class Solution {
    
    // sol 1
    static func pivotIndex(_ nums: [Int]) -> Int {
        var sumOfLeft = [0]
        var sumOfRight = [0]
        
        for index in 1..<nums.count {
            sumOfLeft.append(sumOfLeft[index - 1] + nums[index - 1])
            sumOfRight.insert(sumOfRight[0] + nums[nums.count - index], at: 0)
        }
        
        var foundIndex = -1
        
        for (index, value) in sumOfLeft.enumerated() {
            if sumOfRight[index] == value {
                foundIndex = index
                break
            }
        }
        
        return foundIndex
    }
    
    // sol 2
    static func pivotIndex2(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.reduce(0, +)
        
        for (index, num) in nums.enumerated() {
            right -= num
            if left == right {
                return index
            }
            left += num
        }
        
        return -1
    }
    
    static func dominantIndex(_ nums: [Int]) -> Int {
        let max = nums.enumerated().max { a, b in
            a.element < b.element
        }
        
        for (index, num) in nums.enumerated() {
            if index == max!.offset { continue }
            if num * 2 > max!.element {
                return -1
            }
        }
        
        return max!.offset
    }
    
    static func plusOne(_ digits: [Int]) -> [Int] {
        var carry = 1
        var digits = digits
        
        for index in stride(from: digits.count - 1, through: 0, by: -1) {
            let runningSum = digits[index] + carry
            digits[index] = runningSum % 10
            carry = runningSum / 10
            if carry == 0 {
                break
            }
        }
        
        if carry == 1 {
            digits.insert(1, at: 0)
        }
        
        return digits
    }
    
    static func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        var result = [Int]()
        var i = 0
        var j = 0
        let n = mat.count
        let m = mat[0].count
        
        var direction: Bool = true // up
        while i < n, j < m {
            result.append(mat[i][j])
            
            if direction {
                if j + 1 == m {
                    direction = false
                    i += 1
                } else if i == 0 {
                    direction = false
                    j += 1
                } else {
                    j += 1
                    i -= 1
                }
            } else {
                if i + 1 == n {
                    direction = true
                    j += 1
                } else if j == 0 {
                    direction = true
                    i += 1
                } else {
                    i += 1
                    j -= 1
                }
            }
        }
            
        return result
    }
    
    static func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard  !matrix.isEmpty else {
            return []
        }
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        let count = matrix.count * matrix[0].count
        var arr = [Int]()
        while arr.count < count {
            for i in stride(from: left, to: right+1, by: 1) where arr.count < count {
                arr.append(matrix[top][i])
            }
            top += 1
            for i in stride(from: top, to: bottom+1, by: 1) where arr.count < count {
                arr.append(matrix[i][right])
            }
            right -= 1
            for i in stride(from: right, to: left-1, by: -1) where arr.count < count {
                arr.append(matrix[bottom][i])
            }
            bottom -= 1
            for i in stride(from: bottom, to: top-1, by: -1) where arr.count < count {
                arr.append(matrix[i][left])
            }
            left += 1
        }
        return arr
    }
}

print(Solution.pivotIndex([1,7,3,6,5,6]))
print(Solution.pivotIndex([1,2,3]))
print(Solution.pivotIndex([2,1,-1]))
print(Solution.pivotIndex([0]))
print(Solution.dominantIndex([3,6,1,0]))
print(Solution.dominantIndex([1,2,3,4]))
print(Solution.plusOne([9]))
print(Solution.plusOne([4,3,2,1]))
print(Solution.plusOne([1,2,3]))
print(Solution.findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(Solution.findDiagonalOrder([[1,2],[3,4]]))
print(Solution.spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(Solution.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
