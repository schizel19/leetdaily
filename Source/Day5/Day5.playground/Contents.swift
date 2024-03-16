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
}


print(Solution.heightChecker([1,1,4,2,1,3]))
print(Solution.heightChecker([5,1,2,3,4]))
print(Solution.heightChecker([1,2,3,4,5]))

print(Solution.heightChecker2([1,1,4,2,1,3]))
print(Solution.heightChecker2([5,1,2,3,4]))
print(Solution.heightChecker2([1,2,3,4,5]))
