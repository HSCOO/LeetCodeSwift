
// 解法1：最容易想到的，超时
//class Solution {
//    func dailyTemperatures(_ T: [Int]) -> [Int] {
//        var res:[Int] = []
//        var stack:[Int] = []
//        for (index, item) in T.enumerated() {
//            stack.append(item)
//            var nextIndex = index + 1
//            var resItem = 0
//            while nextIndex < T.count {
//                let nextItem = T[nextIndex]
//                if stack.last! < nextItem {
//                    resItem = nextIndex - index
//                    break
//                }
//                nextIndex += 1
//            }
//            res.append(resItem)
//        }
//        return res
//    }
//}

class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var ans = Array.init(repeating: 0, count: T.count)
        var stack:[Int] = []
        for (index, item) in T.enumerated().reversed() {
            while !stack.isEmpty && item >= T[stack.last!] {
                stack.popLast()
            }
            ans[index] = stack.isEmpty ? 0 : stack.last! - index
            stack.append(index)
        }
        return ans
    }
}

let so = Solution()
so.dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])

