class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jewels = Set<Character>(jewels)
        return stones.reduce(0) { jewels.contains($1) ? $0 + 1 : $0 }
    }
}

print(Solution().numJewelsInStones("aA", "aAAbbbb")) // 3
print(Solution().numJewelsInStones("z", "ZZ")) //0
