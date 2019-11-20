
/// 解法1:
/// 思路：从首页开始比较，相邻数，谁大移除谁
//class Solution {
//    func removeKdigits(_ num: String, _ k: Int) -> String {
//        var stack:[Character] = []
//        var deleteIndex:Int = 0
//
//        if k == 0 {
//            return num
//        }
//
//        if num.count == k {
//            return "0"
//        }
//
//        for char in num {
//            if stack.isEmpty {
//                stack.append(char)
//            }else{
//                stack.append(char)
//
//                if k > deleteIndex {// 在删除次数没有达到时，数组里面只会保存两个数字，比较，移除最大的
//                    let first = Int(String(stack.first!))!
//                    let last = Int(String(stack.last!))!
//                    if first > last {
//                        stack.remove(at: 0)
//                        deleteIndex += 1
//                    }else if last > first{
//                        stack.popLast()
//                        deleteIndex += 1
//                    }
//                }
//            }
//        }
//
//        if deleteIndex == 0 {
//            while deleteIndex < 3 {
//                stack.popLast()
//                deleteIndex += 1
//            }
//        }
//
//        while Int(String(stack.first!))! == 0 && stack.count > 1 {//数组大于1，第一位是0的都需要移除
//            stack.remove(at: 0)
//        }
//
//        return String(stack)
//    }
//}

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        let n = num.count
        let m = n - k//最终保留位数

        var vK = k
        var stack:[Character] = []

        for char in num {
            while vK > 0 && !stack.isEmpty && stack.last! > char  {
                stack.popLast()
                vK = vK - 1
            }
            stack.append(char)
        }
        // 此时已经是单调栈，由低到高，如果大于保留位，从栈顶开始移除
        if  stack.count > m {
            var more = stack.count - m
            while more > 0 {
                stack.popLast()
                more -= 1;
            }
        }

        while !stack.isEmpty && stack.first == "0" {
            stack.remove(at: 0)
        }

        return stack.isEmpty ? "0" : String(stack)
    }
}

let so = Solution()
so.removeKdigits("1432219", 3)
so.removeKdigits("10200", 1)
so.removeKdigits("10", 1)
so.removeKdigits("112", 1)
so.removeKdigits("0", 0)
so.removeKdigits("1111111", 3)

