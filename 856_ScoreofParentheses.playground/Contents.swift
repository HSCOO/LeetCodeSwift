
//class Solution {
//    func scoreOfParentheses(_ S: String) -> Int {
//        guard S.count > 2 else {// 如果只有一个括号
//            return 1
//        }
//        var stack: [Character] = []
//        var indexStack: [Int] = []
//        var res: Int = 0
//        for (index, char) in S.enumerated() {
//            if !stack.isEmpty && stack.last! == "(" && char == ")"  {
//                if indexStack.count == 1 && indexStack.last! == 0 && index == S.count - 1{// 最后一个的左括号是第一个，说明有一个最外层括号，就需要 * 2
//                    res = res * 2
//                }else{
//                    res += 1
//                }
//                indexStack.popLast()
//                stack.popLast()
//            }else{
//                indexStack.append(index)
//                stack.append(char)
//            }
//        }
//        return res
//    }
//}
//
//let so = Solution()
//so.scoreOfParentheses("()")
//so.scoreOfParentheses("()()")
//so.scoreOfParentheses("(()(()))")

/// 官方解答
class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        guard S.count > 2 else {
            return 1
        }
        var stack: [Int] = [0]
        for char in S {
            if char == "(" { // 只要遇到左括号就加0
                stack.append(0)
            }else{ // 右括号就出栈，（最后一个 * 2 + 倒数第二个）
                let v = stack.popLast()!
                let w = stack.popLast()!
                stack.append(w + max(2 * v, 1))
            }
        }
        return stack.popLast()!
    }
}
let so = Solution()
so.scoreOfParentheses("(()(()))")
so.scoreOfParentheses("()()")
so.scoreOfParentheses("(())")
so.scoreOfParentheses("()(()())")


