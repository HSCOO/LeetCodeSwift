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

