
/// 解法1
/// 寻找每个原语最外层括号，并存放到栈deleteFlagStack，
/// 直接用stack保存，除了最外层括号的所有括号
/// saveFlageStack用于记录原语内层括号是否完成
class Solution {

    func removeOuterParentheses(_ S: String) -> String {
        var stack:[Character] = []//保留字符
        var deleteFlagStack: [Character] = []//删除标记
        var saveFlageStack: [Character] = []//判断保留字符是否配对

        for char in S {
            if deleteFlagStack.isEmpty {
                deleteFlagStack.append(char)
            }else{
                if stack.isEmpty {
                    if char == ")" {
                        deleteFlagStack.popLast()
                    }else{
                        stack.append(char)
                    }
                }else{
                    //保留字符成对，并且下一字符是结束，删除标记就需要出栈
                    if saveFlageStack.isEmpty && char == ")"{
                        deleteFlagStack.popLast()
                    }else{
                        stack.append(char)
                    }
                }

                if saveFlageStack.isEmpty {
                    if char == "(" {
                        saveFlageStack.append(char)
                    }
                }else{
                    if saveFlageStack.last == "(" && char == ")" {
                        saveFlageStack.popLast()
                    }else{
                        saveFlageStack.append(char)
                    }
                }
            }
        }

        var finalString = ""
        for char in stack {
            finalString.append(char)
        }
        return finalString
    }
}

let so = Solution()
//so.removeOuterParentheses("(()())")
so.removeOuterParentheses("((((()))))")

/// 解法2
/// 使用变量num记录括号数，配对-1，num为0时代表一个原语或开始，这个时候截取字符串
class Solution2 {
    func removeOuterParentheses(_ S: String) -> String {
        var num = 0 //记录括号，配对成功-1
        var index = 0 //记录内层括号的第一个位置
        var finalString = ""
        for (i, char) in S.enumerated() {
            if char == "(" {
                num = num + 1
            }else if char == ")"{
                num = num - 1
            }

            if num == 1 && char == "(" {
                index = i
            }

            if num == 0 { //括号配对成功。代表一个原语结束，只需要截取字符串的(index+1, i)范围
                let startIndex = S.index(S.startIndex, offsetBy: index + 1)
                let endIndex = S.index(S.startIndex, offsetBy: i)
                let subString = S[startIndex..<endIndex]
                finalString = finalString + subString
            }
        }
        return finalString
    }
}

let so2 = Solution2()
so2.removeOuterParentheses("((((()))))")

