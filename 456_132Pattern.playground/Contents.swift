
/// 解法1:暴力解法，每个数字做比较
/// 解法超时
//class Solution {
//    func find132pattern(_ nums: [Int]) -> Bool {
//        if nums.count < 3 {
//            return false
//        }
//        for (index, item) in nums.enumerated() {
//            var firstIndex = index
//            while firstIndex < nums.count {
//                if nums[firstIndex] > item {//如果第二个数大于第一个数，才找第三个数
//                    var secondIndex = firstIndex
//                    while secondIndex < nums.count {
//                        if nums[secondIndex] > item && nums[firstIndex] > nums[secondIndex] {
//                            return true
//                        }
//                        secondIndex += 1
//                    }
//                }
//                firstIndex += 1
//            }
//        }
//        return false
//    }
//}

class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        if nums.count < 3 {
            return false
        }
        var stack:[Int] = []
        var second = Int.min
        stack.append(nums.last!)
        for item in nums.reversed() {
            if item < second {// 当前位置如果有比second大的数，就表示了栈中有一个当前位置的最大值，second保存的第二大值
                return true
            }else{
                // 栈只保存一个值，当前位置的最大值，遇到比它大的就出栈更新最大值；因为是倒序，序号比second大一位
                // second保存的是上一次的最大值，也就是第二大的值；因为是倒序，所以序号永远是最大的
                while !stack.isEmpty && item > stack.last! {//当前元素比栈里面元素大，就出栈，并保持栈中的最大值，其实就相当于是第二大值
                    second = max(stack.popLast()!, second)
                }
                stack.append(item)
            }
        }
        return false
    }
}

let so = Solution()

so.find132pattern([1, 2, 3, 4])
so.find132pattern([3, 1, 4, 2])
so.find132pattern([-1, 3, 2, 0])

