class Solution {
    static func replaceElements(_ arr: [Int]) -> [Int] {
        if arr.count == 1 { return [-1] }
        var arr = arr
        var lastMax = arr[arr.count - 1]
        
        arr[arr.count - 1] = -1
        for index in stride(from: arr.count - 2, through: 0, by: -1) {
            let current = arr[index]
            arr[index] = max(lastMax, arr[index + 1])
            lastMax = max(current, lastMax)
        }
        return arr
    }
}

print(Solution.replaceElements([17,18,5,4,6,1]))
print(Solution.replaceElements([57010,40840,69871,14425,70605]))
