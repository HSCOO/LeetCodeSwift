class Solution {
    func simplifyPath(_ path: String) -> String {

        var finalStack:[Substring] = ["/"]
        let stringStack:[Substring] = path.split(separator: "/")//先切割成数组
        for subString in stringStack {
            switch subString {
            case ".":
                // 不做处理
                break
            case "..":
                if finalStack.count > 1 {
                    finalStack.popLast() // 先出栈`/`
                    finalStack.popLast() // 再出栈元素（注意可能是单词）
                }
                break
            default:
                finalStack.append(subString)
                finalStack.append("/")
                break
            }
        }

        if finalStack.count > 1 && finalStack.last == "/" {
            finalStack.popLast()
        }

        return finalStack.joined()
    }
}
let so = Solution()
so.simplifyPath("/home/")
so.simplifyPath("/../")
so.simplifyPath("/home//foo/")
so.simplifyPath("/a/./b/../../c/")
so.simplifyPath("/a/../../b/../c//.//")
so.simplifyPath("/a//b////c/d//././/..")
so.simplifyPath("/a/..")



