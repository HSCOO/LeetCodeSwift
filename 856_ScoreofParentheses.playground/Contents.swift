class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        guard S.count > 2 else {// 如果只有一个括号
            return 1
        }
        var stack: [Character] = []
        var indexStack: [Int] = []
        var res: Int = 0
        for (index, char) in S.enumerated() {
            if !stack.isEmpty && stack.last! == "(" && char == ")"  {
                if indexStack.count == 1 && indexStack.last! == 0 && index == S.count - 1{// 最后一个的左括号是第一个，说明有一个最外层括号，就需要 * 2
                    res = res * 2
                }else{
                    res += 1
                }
                indexStack.popLast()
                stack.popLast()
            }else{
                indexStack.append(index)
                stack.append(char)
            }
        }
        return res
    }
}

let so = Solution()
so.scoreOfParentheses("()")
so.scoreOfParentheses("()()")
so.scoreOfParentheses("(()(()))")
