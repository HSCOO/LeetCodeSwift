/// 解法1
/// 直接用一个栈来保存每个字符，保存前检查最后一个字符和待加入的字符是否相等，相等就出栈
class Solution {
    func removeDuplicates(_ S: String) -> String {
        var stack: [Character] = []
        for char in S {
            if stack.last == char {
                stack.popLast()
            }else{
                stack.append(char)
            }
        }
        return String(stack)
    }
}

let so = Solution()
so.removeDuplicates("abbaca")

