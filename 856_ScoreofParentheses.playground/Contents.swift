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

