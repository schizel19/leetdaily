class Solution {
    // simple, with sort
    static func heightChecker(_ heights: [Int]) -> Int {
        return heights.sorted().enumerated().filter { $0.element != heights[$0.offset] }.count
    }
    
    // no sort
    static func heightChecker2(_ heights: [Int]) -> Int {
        var heightCount = [Int: Int]()
        for height in heights {
            heightCount[height] = heightCount[height, default: 0] + 1
        }
        
        var notInPlace = 0
        var currentHeight = 0
        
        for index in 0..<heights.count {
            while heightCount[currentHeight, default: 0] == 0 {
                currentHeight += 1
            }
            
            if currentHeight != heights[index] {
                notInPlace += 1
            }
            
            heightCount[currentHeight] = heightCount[currentHeight, default: 0] - 1
        }
        
        return notInPlace
    }
    
    // 3 loop
    static func thirdMax(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        if nums.count == 2 { return max(nums[0], nums[1]) }
        
        var firstMax: Int!
        var secondMax: Int!
        var thirdMax: Int!
        
        for num in nums {
            firstMax = firstMax ?? num
            firstMax = max(num, firstMax)
        }
        
        for num in nums {
            guard num != firstMax else { continue }
            secondMax = secondMax ?? num
            secondMax = max(num, secondMax)
        }
        
        for num in nums {
            guard num != secondMax, num != firstMax else { continue }
            thirdMax = thirdMax ?? num
            thirdMax = max(num, thirdMax)
        }
        
        return thirdMax != nil ? thirdMax! : firstMax
    }
    
    // one loop
    static func thirdMax2(_ nums: [Int]) -> Int {
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for num in nums {
            if num > max1 {
                max3 = max2
                max2 = max1
                max1 = num
            } else if num > max2, num != max1 {
                max3 = max2
                max2 = num
            } else if num > max3, num != max2, num != max1 {
                max3 = num
            }
        }
        
        return max3 == Int.min ? max1 : max3
    }
}


print(Solution.heightChecker([1,1,4,2,1,3]))
print(Solution.heightChecker([5,1,2,3,4]))
print(Solution.heightChecker([1,2,3,4,5]))

print(Solution.heightChecker2([1,1,4,2,1,3]))
print(Solution.heightChecker2([5,1,2,3,4]))
print(Solution.heightChecker2([1,2,3,4,5]))

print(Solution.thirdMax([3,2,1]))
print(Solution.thirdMax([2,1]))
print(Solution.thirdMax([2,3,2,1]))


print(Solution.thirdMax2([3,2,1]))
print(Solution.thirdMax2([2,1]))
print(Solution.thirdMax2([2,3,2,1]))
