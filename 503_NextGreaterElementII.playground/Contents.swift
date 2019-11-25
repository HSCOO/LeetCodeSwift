
/// 解法1: 完全遍历，超时
//class Solution {
//    func nextGreaterElements(_ nums: [Int]) -> [Int] {
//        var stack:[Int] = []
//        for (index, item) in nums.enumerated() {
//
//            // 2.遍历查找
//            var nextIndex = 0
//            while nextIndex < nums.count{
//                let nextItem = nums[nextIndex]
//                if nextItem > item{
//                    if stack.count < index + 1 {//当前位置没有元素直接加上
//                        stack.append(nextItem)
//                    }else{
//                        if let stackCacheIndex = nums.firstIndex(of: stack.last!) {
//                            if stackCacheIndex < index && nextIndex > index { // 之前保存过比序号小的数，并且现在有比当前序号大的数
//                                stack.popLast()
//                                stack.append(nextItem)
//                                break
//                            }
//                        }
//                    }
//                }
//                nextIndex += 1
//            }
//            // 3.遍历完之后检查是否找到，没有找到就添加-1
//            if stack.count < index + 1 {
//                stack.append(-1)
//            }
//        }
//        return stack
//    }
//}

class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let n = nums.count
        if n == 0 {
            return nums
        }
        var stack: [Int] = []
        var res:[Int] = Array.init(repeating: 0, count: n)
        for i in (0...(2*n - 1)).reversed() {
            while !stack.isEmpty && stack.last! <= nums[i%n] {//这里维护的是一个单调栈
                stack.popLast()
            }
            res[i%n] = stack.isEmpty ? -1 : stack.last!
            stack.append(nums[i%n])
        }
        return res
    }
}

let so = Solution()
so.nextGreaterElements([1,2,3,4,3])//-> [2, 3, 4, -1, 4]
//so.nextGreaterElements([1,2,3,4,5])//[1,2,3,4,5] -> 2, 3, 4, 5, -1]
//so.nextGreaterElements([5,4,3,2,1])//[5,4,3,2,1] -> [-1, 5, 5, 5, 5]
//so.nextGreaterElements([100,1,11,1,120,111,123,1,-1,-100])//[100,1,11,1,120,111,123,1,-1,-100]
so.nextGreaterElements([])//-> [2, 3, 4, -1, 4]
