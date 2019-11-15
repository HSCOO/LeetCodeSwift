class Solution {
    func decodeString(_ s: String) -> String {
        var finalString = ""
        var multi = 0
        var stackMulti: [Int] = []
        var stackRes: [String] = []

        s.forEach { (char) in
            switch char {
            case "[":
                stackMulti.append(multi)
                stackRes.append(finalString)
                multi = 0
                finalString = ""
                break
            case "]":
                var tmpString = ""
                let currentMulti = stackMulti.popLast()!
                for _ in 0..<currentMulti {
                    tmpString += finalString
                }
                finalString = stackRes.popLast()! + tmpString
                break

            case let tmpChar where (tmpChar >= "0" && tmpChar <= "9"):
                multi = multi * 10 + Int(String(tmpChar))!
                break
            default:
                finalString.append(char)
                break
            }
        }
        return finalString
    }
}

let so = Solution()
so.decodeString("3[a]2[bc]")
so.decodeString("3[a2[c]]")
so.decodeString("2[abc]3[cd]ef")
